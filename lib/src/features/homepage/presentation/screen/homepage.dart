import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../component/repository_item_card.dart';
import '../cubit/home_cubit.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Top Flutter Repositories'),
          actions: [
            // Sort by stars
            PopupMenuButton(
              onSelected: (value) {
                context.read<HomeCubit>().sortRepositories(value);
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  enabled:
                      !state.sortBy!.contains('last_updated') ? true : false,
                  value: 'last_updated',
                  child: Text('Sort by Last Updated Date-Time'),
                ),
                PopupMenuItem(
                  enabled: !state.sortBy!.contains('stars') ? true : false,
                  value: 'stars',
                  child: Text('Sort by Star Count'),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: !state.isLoading!
              ? Column(
                  children: [
                    Expanded(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification scrollInfo) {
                          print(scrollInfo.metrics.pixels);
                          if (!state.isLoading! &&
                              scrollInfo.metrics.pixels ==
                                  scrollInfo.metrics.maxScrollExtent) {
                            if (state.isFetching == false ?? false) {
                              print('fetching');
                              context.read<HomeCubit>().fetchRepositories();
                            }

                            // state.scrollController!.animateTo(
                            //   state.scrollController!.position.pixels + 100,
                            //   duration: const Duration(milliseconds: 300),
                            //   curve: Curves.easeOut,
                            // );
                          }
                          return true;
                        },
                        child: ListView.builder(
                          controller: state.scrollController,
                          itemCount: state.items!.length,
                          itemBuilder: (context, index) {
                            return RepositoryItemCard(
                              item: state.items![index],
                            );
                          },
                        ),
                      ),
                    ),
                    if (state.isFetching!)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      )
                  ],
                )
              : const CircularProgressIndicator(),
        ),
      );
    });
  }
}
