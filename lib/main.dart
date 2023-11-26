import 'package:dog_app/bloc/dog_bloc.dart';
import 'package:dog_app/core/init/navigation/navigation_route.dart';
import 'package:dog_app/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogDataBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
      ),
    );
  }
}
