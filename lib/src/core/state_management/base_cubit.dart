
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'base_state.dart';

abstract class BaseCubit<S extends BaseState> extends Cubit<S>
    with WidgetsBindingObserver {
  // final BaseRouter router;

  BaseCubit(S initialState /*, this.router*/) : super(initialState) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> close() async {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }
}