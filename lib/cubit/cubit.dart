import 'package:bloc/bloc.dart';
import 'package:travelapp/cubit/cubit_states.dart';
import 'package:travelapp/services/data_services.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  Future<void> getData() async {
    try {
      emit(LoadingState());
      places =await data.getInfo();
      emit(LoadedState(places));

    } catch (e) {}
  }
}
