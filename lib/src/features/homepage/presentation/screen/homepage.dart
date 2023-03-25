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
              icon: const Icon(Icons.sort),
              itemBuilder: (context) => [
                PopupMenuItem(
                  enabled:
                      !state.sortBy!.contains('last_updated') ? true : false,
                  value: 'last_updated',
                  child: const Text('Sort by Last Updated Date-Time'),
                ),
                PopupMenuItem(
                  enabled: !state.sortBy!.contains('stars') ? true : false,
                  value: 'stars',
                  child: const Text('Sort by Star Count'),
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
                              if (state.isFetching == false) {
                                print('fetching');
                                context.read<HomeCubit>().fetchRepositories();
                              }
                            }
                            return true;
                          },
                          child: state.items!.isNotEmpty
                              ? ListView.builder(
                                  controller: state.scrollController,
                                  addAutomaticKeepAlives: false,
                                  itemCount: state.items!.length,
                                  itemBuilder: (context, index) {
                                    return RepositoryItemCard(
                                      item: state.items![index],
                                    );
                                  },
                                )
                              : const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      'No Repositories Found\n\n Please Check Your Internet Connection and Try Again',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey),
                                    ),
                                  ),
                                )),
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
