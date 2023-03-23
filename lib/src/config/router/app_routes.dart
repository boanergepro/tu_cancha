import 'package:flutter/material.dart';
import 'package:tu_cancha/src/presentation/views/home_view.dart';
import 'package:tu_cancha/src/presentation/views/new_scheduling_view.dart';

var routes = {
  '/':                    (context) => const HomeView(),
  '/newScheduling':       (context) => const NewSchedulingView()
};