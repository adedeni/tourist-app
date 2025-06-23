import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/cubit.dart';
import 'package:travelapp/cubit/cubit_logic.dart';
import 'package:travelapp/services/data_services.dart';
//import 'package:travelapp/screens/detail_page.dart';
//import 'package:travelapp/screens/navigation/main_page.dart';
//import 'package:travelapp/screens/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      //home: WelcomePage(),
      //home: MainPage(),
      home: BlocProvider<AppCubit>(create: (context) => AppCubit(
        data:DataServices()
      ),
      child: CubitLogic(),
      ),
    );
  }
}
