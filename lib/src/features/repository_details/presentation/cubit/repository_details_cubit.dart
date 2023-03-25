import 'package:bs23_flutter_task/src/core/model/repository_list_response_model.dart';

import '../../../../core/state_management/base_cubit.dart';
part 'repository_details_state.dart';

class RepositoryDetailsCubit extends BaseCubit<RepositoryDetailsState> {
  RepositoryDetailsCubit() : super(RepositoryDetailsState());

  Future<void> onInit(Item? item) async {
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(item: item));
    emit(state.copyWith(isLoading: false));
  }
}
