import 'package:cloud_firestore/cloud_firestore.dart' hide GeoPoint;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:pinggo/core/data/local/local_storage.dart';
import 'package:pinggo/core/di/service_locator.dart';
import 'package:pinggo/features/attendance_map/all_event/cubit/event_map_cubit.dart';
import 'package:pinggo/features/attendance_map/all_event/cubit/event_map_state.dart';
import 'package:pinggo/features/attendance_map/repository/map_repository_impl.dart';

class EventMapScreen extends StatefulWidget {
  const EventMapScreen({super.key});

  @override
  State<EventMapScreen> createState() => _EventMapScreenState();
}

class _EventMapScreenState extends State<EventMapScreen> {
  bool _canAttend = false;
  bool _checking = false;

  Future<void> _checkAttendanceEligibility(EventMapCubit cubit) async {
    setState(() => _checking = true);
    final eligible = await cubit.isUserWithinAnyRadius();
    setState(() {
      _canAttend = eligible;
      _checking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mapController = MapController(
      initPosition: GeoPoint(latitude: 23.8103, longitude: 90.4125),
    );
    final mapRepository = MapRepositoryImpl(FirebaseFirestore.instance, sl<LocalStorage>());

    return BlocProvider(
      create: (_) => EventMapCubit(mapController: mapController,
        mapRepository: mapRepository,),
      child: BlocConsumer<EventMapCubit, EventMapState>(
          listener: (context, state) {
            if (state.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Attendance recorded!')),
              );
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('No event found under your location!')),
              );
            }
          },
        builder: (context, state) {
          final cubit = context.read<EventMapCubit>();

          return Stack(
            children: [
              OSMFlutter(
                controller: cubit.mapController,
                onMapIsReady: (ready) async {
                  if (ready) {
                    await cubit.drawEventCircles();
                    await _checkAttendanceEligibility(cubit);
                  }
                },
                osmOption: OSMOption(
                  userTrackingOption: const UserTrackingOption(
                    enableTracking: true,
                    unFollowUser: false,
                  ),
                  zoomOption: const ZoomOption(
                    initZoom: 15,
                    minZoomLevel: 8,
                    maxZoomLevel: 19,
                    stepZoom: 1.0,
                  ),
                  userLocationMarker: UserLocationMaker(
                    personMarker: const MarkerIcon(
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 150,
                      ),
                    ),
                    directionArrowMarker: const MarkerIcon(
                      icon: Icon(Icons.double_arrow, size: 48),
                    ),
                  ),
                ),
              ),
              if (_canAttend && !_checking)
                Positioned(
                  bottom: 32,
                  right: 32,
                  child: FloatingActionButton.extended(
                    onPressed: () async {
                      final cubit = context.read<EventMapCubit>();
                      final currentLocation = await cubit.mapController.myLocation();
                      final user = FirebaseAuth.instance.currentUser;
                      final userName = user?.displayName ?? "Unknown";
                      final userId = user?.uid ?? "Unknown";

                      await cubit.giveAttendance(
                        userLat: currentLocation.latitude,
                        userLon: currentLocation.longitude,
                        userId: userId,
                        userName: userName,
                      );

                    },
                    icon: const Icon(Icons.how_to_reg),
                    label: const Text('Give Attendance'),
                  )
                ),
            ],
          );
        },

      ),
    );
  }
}