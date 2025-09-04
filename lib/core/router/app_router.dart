import 'package:go_router/go_router.dart';
import 'package:pinggo/core/di/service_locator.dart';
import 'package:pinggo/features/attendance_map/all_event/ui/event_map_screen.dart';
import 'package:pinggo/features/attendance_map/set_location/ui/set_location_map_screen.dart';
import 'package:pinggo/features/auth/login/ui/login_screen.dart';
import 'package:pinggo/features/auth/register/ui/registration_screen.dart';
import 'package:pinggo/features/auth/repository/auth_repository.dart';
import 'package:pinggo/features/home/ui/home_screen.dart';


// GoRouter configuration
final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: sl<AuthRepository>().isLoggedIn() ? "/home" : '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/registration',
      builder: (context, state) => RegistrationScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/set_location_map',
      builder: (context, state) => SetLocationMapScreen(),
    ),
    GoRoute(
      path: '/event_map',
      builder: (context, state) => EventMapScreen(),
    ),


  ],
);
