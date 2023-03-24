import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../component/repository_item_card.dart';
import '../cubit/home_cubit.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  // final ScrollController scrollController = ScrollController();

  // _ScrollPosition() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setDouble('scrollPosition', scrollController.position.pixels);
  // }

  @override
  Widget build(BuildContext context) {
    // scrollController.addListener(() {
    //   _ScrollPosition();
    // });
    // scrollController.jumpTo(scrollController.position.maxScrollExtent);
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Top Flutter Repositories'),
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
