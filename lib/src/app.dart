import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:tu_cancha/src/config/router/app_routes.dart';
import 'package:tu_cancha/src/presentation/controllers/home_view_controller.dart';
import 'package:tu_cancha/src/presentation/controllers/new_scheduling_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewController()),
        ChangeNotifierProvider(create: (_) => NewSchedulingController()),
      ],
      child: MaterialApp(
        routes: routes,
        builder: EasyLoading.init(),
      ),
    );
  }
}
