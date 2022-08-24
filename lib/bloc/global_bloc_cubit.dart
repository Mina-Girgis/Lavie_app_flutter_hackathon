import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'global_bloc_state.dart';

class GlobalBlocCubit extends Cubit<GlobalBlocState> {

  GlobalBlocCubit() : super(GlobalBlocInitial());
  static GlobalBlocCubit get(context)=>BlocProvider.of(context);

  int index=0;
  void changeIndex(){
    index++;
    emit(ChangeIndex());
  }

}
