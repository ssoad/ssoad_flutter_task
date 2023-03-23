import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../core/model/repository_list_response_model.dart';
import '../../../../core/state_management/base_cubit.dart';
import '../repository/home_repository.dart';
part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeState());

  Future<void> onInit() async {
    emit(state.copyWith(isLoading: true));
    var result = await _homeRepository.getHome(0);
    emit(state.copyWith(isLoading: false, items: result));
  }
}
