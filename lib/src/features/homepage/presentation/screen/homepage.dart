import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/repository_item_card.dart';
import '../cubit/home_cubit.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Top Flutter Repositories'),
        ),
        body: Center(
          child: !state.isLoading!
              ? ListView.builder(
                  itemCount: state.items!.length,
                  itemBuilder: (context, index) {
                    return RepositoryItemCard(
                      item: state.items![index],
                    );
                  },
                )
              : const CircularProgressIndicator(),
        ),
      );
    });
  }
}
