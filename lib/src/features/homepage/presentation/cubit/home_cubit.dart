import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../core/state_management/base_cubit.dart';
part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(HomeState());

  Future<void> onInit() async{
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(isLoading: false));
  }
}