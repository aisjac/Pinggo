import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinggo/features/home/cubit/home_cubit.dart';
import 'package:pinggo/features/home/cubit/home_state.dart';

class HomeAttendance extends StatefulWidget {
  const HomeAttendance({super.key});

  @override
  State<HomeAttendance> createState() => _HomeAttendanceState();
}

class _HomeAttendanceState extends State<HomeAttendance> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().loadEventsWithAttendance();
    });
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      context.read<HomeCubit>().loadEventsWithAttendance();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return LinearProgressIndicator();
        }
        if (state.error != null) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(state.error!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeCubit>().loadEventsWithAttendance();
                  },
                  child: const Text("Retry"),
                )
              ],
            ),
          );
        }
        if (state.isSuccess) {
          if (state.events.isEmpty) {
            return const Center(child: Text("No events found."));
          }
          return Expanded(
            child: ListView.builder(
              itemCount: state.events.length,
              itemBuilder: (context, index) {
                final event = state.events[index];
                return Center(child: Text('Attendance: ${event['attendanceCount'] ?? 0}'));
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}