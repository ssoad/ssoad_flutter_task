import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/owner_info_card.dart';
import '../component/repository_info.dart';
import '../cubit/repository_details_cubit.dart';

class RepositoryDetails extends StatelessWidget {
  const RepositoryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoryDetailsCubit, RepositoryDetailsState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(state.item!.fullName!),
        ),
        body: state.isLoading!
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      OwnerInfo(item: state.item),
                      const SizedBox(
                        height: 20,
                      ),
                      RepositoryInfo(item: state.item),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
