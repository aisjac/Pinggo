import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:pinggo/core/utils/custom_toast.dart';
import 'package:pinggo/features/attendance_map/set_location/cubit/set_location_map_cubit.dart';
import 'package:pinggo/features/attendance_map/set_location/cubit/set_location_map_state.dart';

class SetLocationMapScreen extends StatelessWidget {
  SetLocationMapScreen({super.key});

  final formKey = GlobalKey<FormBuilderState>();
  final latTextFieldController = TextEditingController();
  final lonTextFieldController = TextEditingController();

  void _initMapTapListener(BuildContext context, SetLocationMapCubit cubit) {
    cubit.mapController?.listenerMapSingleTapping.addListener(() async {
      final geoPoint = cubit.mapController?.listenerMapSingleTapping.value;
      if (geoPoint != null) {
        await cubit.setTappedLocation(geoPoint);
        latTextFieldController.text = geoPoint.latitude.toString();
        lonTextFieldController.text = geoPoint.longitude.toString();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Marker Set"),
            content: FormBuilder(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text("Lat:"),
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'lat',
                          keyboardType: TextInputType.number,
                          controller: latTextFieldController,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Lon:"),
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'lon',
                          keyboardType: TextInputType.number,
                          controller: lonTextFieldController,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ]),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text("Rad:"),
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'radius',
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: 'Radius'),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (formKey.currentState?.saveAndValidate() ?? false) {
                    final formData = formKey.currentState!.value;
                    cubit.setActiveEvent(formData);
                    print(formData);
                    context.pop();
                  }
                },
                child: Text("Set"),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SetLocationMapCubit()..checkPermissionAndInitLocation(),
      child: BlocConsumer<SetLocationMapCubit, SetLocationMapState>(
        listener: (BuildContext context, SetLocationMapState state) {

          if(state.isSuccess){
            CustomToast.showSuccess("Location Set successfully");
            context.pop();
          }

        },
        builder: (context, state) {
          final cubit = context.read<SetLocationMapCubit>();

          if (!state.hasLocationPermission) {

            return Center(child: Text('Location permission required.'));
          }

          if (state.isLoading && state.currentLocation == null) {
            return Center(child: CircularProgressIndicator());
          }

          if (state.isError && state.currentLocation == null) {
            return Center(child: Text(state.errorMessage ?? 'Unknown error'));
          }

          if (state.currentLocation == null || cubit.mapController == null) {
            return Center(child: Text('No location available.'));
          }

          return OSMFlutter(
            controller: cubit.mapController!,
            onMapIsReady: (ready) async {
              if (ready) {
                cubit.onMapReady();
                _initMapTapListener(context, cubit);
              }
            },
            osmOption: OSMOption(
              userTrackingOption: const UserTrackingOption(
                enableTracking: false,
                unFollowUser: true,
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
                    Icons.location_history_rounded,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
                directionArrowMarker: const MarkerIcon(
                  icon: Icon(Icons.double_arrow, size: 48),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
