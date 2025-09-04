import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pinggo/core/data/local/local_storage.dart';
import 'package:pinggo/core/data/local/local_storage_key.dart';
import 'package:pinggo/core/di/service_locator.dart';
import 'package:pinggo/core/utils/greeting.dart';
import 'package:pinggo/features/home/cubit/home_cubit.dart';
import 'package:pinggo/features/home/cubit/home_state.dart';
import 'package:pinggo/features/home/ui/home_attendance.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(LocalStorageKey.userEmail);
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          final localStorage = sl<LocalStorage>();
          print("${localStorage.getString(LocalStorageKey.userName)}");
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AppBar(
                    leading: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: CircleAvatar(radius: 20, child: Icon(Icons.person)),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello! ${getGreeting()}",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          "${localStorage.getString(LocalStorageKey.userName)}",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          context.go('/');
                        },
                        icon: Icon(Icons.logout),
                      ),
                    ],
                  ),
                  Gap(16),
                  sl<LocalStorage>().getString(LocalStorageKey.userRole) == 'admin' ? Card(
                    elevation: 0,
                    child: ListTile(
                      title: Text("Set Location"),
                      onTap: () {
                        context.push('/set_location_map');
                      },
                      trailing: Icon(Icons.pin_drop_outlined),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ):SizedBox(),
                  sl<LocalStorage>().getString(LocalStorageKey.userRole) == 'admin' ?Gap(8):SizedBox(),
                  sl<LocalStorage>().getString(LocalStorageKey.userRole) != 'admin' ? Card(
                    elevation: 0,
                    child: ListTile(
                      title: Text("Events"),
                      onTap: () {
                        context.push('/event_map');
                      },
                      trailing: Icon(Icons.pin_drop_outlined),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ):SizedBox(),
                  sl<LocalStorage>().getString(LocalStorageKey.userRole) != 'admin' ? Gap(24) :SizedBox(),
                  const HomeAttendance(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}