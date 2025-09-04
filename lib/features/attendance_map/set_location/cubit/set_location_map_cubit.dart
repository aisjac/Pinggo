import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinggo/core/di/service_locator.dart';
import 'package:pinggo/features/attendance_map/repository/map_repository.dart';
import 'set_location_map_state.dart';

class SetLocationMapCubit extends Cubit<SetLocationMapState> {
  MapController? mapController;
  bool mapIsReady = false;
  late MapRepository _mapRepository;

  SetLocationMapCubit() : super(const SetLocationMapState()){
    _mapRepository = sl<MapRepository>();
  }

  Future<void> checkPermissionAndInitLocation() async {
    emit(state.copyWith(isLoading: true, isError: false));
    final status = await Permission.location.request();
    final granted = status == PermissionStatus.granted;
    if (!granted) {
      emit(state.copyWith(
        hasLocationPermission: false,
        isLoading: false,
        isError: true,
        errorMessage: "Location permission denied",
      ));
      return;
    }
    emit(state.copyWith(hasLocationPermission: true));
    mapController = MapController(
      initPosition: GeoPoint(latitude: 23.8103, longitude: 90.4125),
    );    await getCurrentLocation();

    if (mapIsReady && state.currentLocation != null) {
      await showCurrentLocationMarker();
    }
  }

  Future<void> getCurrentLocation() async {
    emit(state.copyWith(isLoading: true, isError: false));
    try {
      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final geoPoint = GeoPoint(latitude: pos.latitude, longitude: pos.longitude);
      emit(state.copyWith(
        currentLocation: geoPoint,
        isLoading: false,
        isError: false,
      ));

      if (mapIsReady && state.currentLocation != null) {
        await showCurrentLocationMarker();
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: "Failed to get location: $e",
      ));
    }
  }

  Future<void> showCurrentLocationMarker() async {
    await mapController?.addMarker(
      state.currentLocation!,
      markerIcon: MarkerIcon(
        icon: Icon(Icons.location_on, color: Colors.red, size: 150),
      ),
    );
    await mapController?.changeLocation(state.currentLocation!);
  }

  Future<void> onMapReady() async {
    mapIsReady = true;
    if (state.currentLocation != null) {
      await showCurrentLocationMarker();
    }
  }

  Future<void> setTappedLocation(GeoPoint geoPoint) async {

    if (state.tappedLocation != null) {
      await mapController?.removeMarker(state.tappedLocation!);
    }

    await mapController?.addMarker(
      geoPoint,
      markerIcon: MarkerIcon(
        icon: Icon(Icons.place, color: Colors.blue, size: 150),
      ),
    );
    emit(state.copyWith(tappedLocation: geoPoint));
  }

  Future<void> clearTappedLocation() async {
    if (state.tappedLocation != null) {
      await mapController?.removeMarker(state.tappedLocation!);
      emit(state.copyWith(tappedLocation: null));
    }
  }





  Future<void> setActiveEvent(Map<String, dynamic> data) async {
    print("Api Called!");
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    try {
      await _mapRepository.setLocation(data);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        isSuccess: false,
      ));
    }
  }


}