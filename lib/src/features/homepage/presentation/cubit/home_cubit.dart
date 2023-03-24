import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../core/model/repository_list_response_model.dart';
import '../../../../core/state_management/base_cubit.dart';
import '../../repository/home_repository.dart';
part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final HomeRepository _homeRepository;
  // late ScrollController scrollController;

  HomeCubit(this._homeRepository) : super(HomeState());
  // {
  //   scrollController = ScrollController();
  //   scrollController.addListener(() {
  //     if (scrollController.position.pixels ==
  //         scrollController.position.maxScrollExtent) {
  //       fetchRepositories();
  //     }
  //   });
  // }

  Future<void> onInit() async {
    emit(state.copyWith(
        isLoading: true,
        page: 1,
        scrollController: ScrollController(),
        isFetching: false));
    var result = await _homeRepository.fetchRepositories(state.page!);
    emit(state.copyWith(isLoading: false, items: result));
  }

  Future<void> fetchRepositories() async {
    // double currentScrollPosition = state.scrollController!.position.pixels;
    print("New Items are being fetched");
    emit(state.copyWith(isFetching: true));
    var result = await _homeRepository.fetchRepositories(state.page! + 1);
    // ScrollController scrollController =
    // ScrollController(initialScrollOffset: currentScrollPosition);
    state.items!.addAll(result);
    emit(state.copyWith(
        isFetching: false,
        // scrollController: scrollController,
        items: state.items!,
        page: state.page! + 1));
    // scrollController.animateTo(
    //   scrollController.position.pixels + 100,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.easeOut,
    // );
  }
}
