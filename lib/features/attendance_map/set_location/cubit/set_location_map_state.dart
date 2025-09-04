import 'package:equatable/equatable.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class SetLocationMapState extends Equatable {
  final bool hasLocationPermission;
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final String? errorMessage;
  final GeoPoint? currentLocation;
  final GeoPoint? tappedLocation;

  const SetLocationMapState({
    this.hasLocationPermission = false,
    this.isLoading = false,
    this.isSuccess = false,
    this.isError = false,
    this.errorMessage,
    this.currentLocation,
    this.tappedLocation,
  });

  SetLocationMapState copyWith({
    bool? hasLocationPermission,
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    String? errorMessage,
    GeoPoint? currentLocation,
    GeoPoint? tappedLocation,
  }) {
    return SetLocationMapState(
      hasLocationPermission: hasLocationPermission ?? this.hasLocationPermission,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      currentLocation: currentLocation ?? this.currentLocation,
      tappedLocation: tappedLocation ?? this.tappedLocation,
    );
  }

  @override
  List<Object?> get props => [
    hasLocationPermission,
    isLoading,
    isSuccess,
    isError,
    errorMessage,
    currentLocation,
    tappedLocation,
  ];
}