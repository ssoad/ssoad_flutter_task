import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../core/state_management/base_cubit.dart';
part 'repository_details_state.dart';

class RepositoryDetailsCubit extends BaseCubit<RepositoryDetailsState> {
  RepositoryDetailsCubit() : super(RepositoryDetailsState());

  Future<void> onInit() async{
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(isLoading: false));
  }
}