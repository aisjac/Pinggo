import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:pinggo/core/data/local/local_storage.dart';
import 'package:pinggo/features/attendance_map/repository/map_repository.dart';
import 'package:pinggo/features/attendance_map/repository/map_repository_impl.dart';
import 'package:pinggo/features/auth/repository/auth_repository.dart';
import 'package:pinggo/features/auth/repository/auth_repository_impl.dart';
import 'package:pinggo/features/home/repository/home_repository.dart';
import 'package:pinggo/features/home/repository/home_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

// Local storage
  sl.registerLazySingleton<LocalStorage>(() => LocalStorage(sl<SharedPreferences>()));

// Firebase services
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);


// Repository
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      sl<FirebaseAuth>(),
      sl<FirebaseFirestore>(),
      sl<LocalStorage>(),
    ),
  );
  sl.registerLazySingleton<MapRepository>(
        () => MapRepositoryImpl(
      sl<FirebaseFirestore>(),
      sl<LocalStorage>(),
    ),
  );

  sl.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(
      sl<FirebaseFirestore>(),
    ),
  );
}