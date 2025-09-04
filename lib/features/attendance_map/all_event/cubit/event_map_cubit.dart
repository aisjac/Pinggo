import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'event_map_state.dart';
import 'package:pinggo/features/attendance_map/repository/map_repository.dart';

class EventMapCubit extends Cubit<EventMapState> {
  final MapController mapController;
  final MapRepository mapRepository;
  StreamSubscription<List<Map<String, dynamic>>>? _eventsSubscription;

  EventMapCubit({
    required this.mapController,
    required this.mapRepository,
  }) : super(const EventMapState()) {
    _eventsSubscription = mapRepository.streamAllEvents().listen((events) {
      emit(state.copyWith(events: events));
    });
  }



  Future<void> giveAttendance({
    required double userLat,
    required double userLon,
    required String userId,
    required String userName,
  }) async {

    Map<String, dynamic>? event;
    for (final e in state.events) {
      final distance = distanceInMeters(
        userLat,
        userLon,
        double.tryParse(e['lat'].toString()) ?? 0,
        double.tryParse(e['lon'].toString()) ?? 0,
      );
      if (distance <= (double.tryParse(e['radius'].toString()) ?? 0)) {
        event = e;
        break;
      }
    }

    if (event != null && event['id'] != null) {
      await mapRepository.addAttendance(
        eventId: event['id'],
        userId: userId,
        userName: userName,
        lat: userLat,
        lon: userLon,
        time: DateTime.now(),
      );
      emit(state.copyWith(success: true));
    } else {
      emit(state.copyWith(success: false));
    }
  }

  Future<void> drawEventCircles() async {
    await mapController.removeAllCircle();
    for (final event in state.events) {
      final lat = double.tryParse(event['lat'].toString()) ?? 0;
      final lon = double.tryParse(event['lon'].toString()) ?? 0;
      final radius = double.tryParse(event['radius'].toString()) ?? 0;
      final geoPoint = GeoPoint(latitude: lat, longitude: lon);

      await mapController.drawCircle(
        CircleOSM(
          key: "event_circle_${lat}_${lon}",
          centerPoint: geoPoint,
          radius: radius,
          color: Colors.blue.withOpacity(0.3),
          strokeWidth: 2,
          borderColor: Colors.blue,
        ),
      );
    }
  }

  Future<bool> isUserWithinAnyRadius() async {
    try {
      final currentLocation = await mapController.myLocation();
      for (final event in state.events) {
        final lat = double.tryParse(event['lat'].toString()) ?? 0;
        final lon = double.tryParse(event['lon'].toString()) ?? 0;
        final radius = double.tryParse(event['radius'].toString()) ?? 0;

        final distance = distanceInMeters(
          currentLocation.latitude,
          currentLocation.longitude,
          lat,
          lon,
        );

        if (distance <= radius) return true;
      }
    } catch (_) {
      return false;
    }
    return false;
  }

  double distanceInMeters(double lat1, double lon1, double lat2, double lon2) {
    const earthRadius = 6371000.0;
    final dLat = _degreesToRadians(lat2 - lat1);
    final dLon = _degreesToRadians(lon2 - lon1);
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _degreesToRadians(double degrees) => degrees * pi / 180;

  @override
  Future<void> close() {
    _eventsSubscription?.cancel();
    return super.close();
  }
}