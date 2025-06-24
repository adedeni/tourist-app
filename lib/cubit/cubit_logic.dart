import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/cubit.dart';
import 'package:travelapp/cubit/cubit_states.dart';
import 'package:travelapp/screens/detail_page.dart';
///import 'package:travelapp/screens/home_page.dart';
import 'package:travelapp/screens/navigation/main_page.dart';
import 'package:travelapp/screens/welcome_page.dart';

class CubitLogic extends StatefulWidget {
  const CubitLogic({super.key});

  @override
  State<CubitLogic> createState() => _CubitLogicState();
}

class _CubitLogicState extends State<CubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is DetailState) {
            return DetailPage();
          }
          if (state is LoadedState) {
            return MainPage();
          }
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
