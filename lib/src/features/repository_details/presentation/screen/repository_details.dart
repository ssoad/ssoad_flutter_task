import 'package:bs34_flutter_task/src/core/model/repository_list_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/dateUtils.dart';
import '../component/owner_info_card.dart';
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
                      Row(
                        children: [
                          const Icon(
                            Icons.book,
                            size: 30,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            state.item!.name!,
                            style: const TextStyle(fontSize: 30),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Last updated on : " +
                            parseStringDate(state.item!.updatedAt!)!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Watchers: ${state.item!.watchersCount}"),
                            )),
                            const SizedBox(
                              width: 20,
                            ),
                            Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Forks: ${state.item!.forksCount}"),
                            )),
                            const SizedBox(
                              width: 20,
                            ),
                            Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text("Stars: ${state.item!.stargazersCount}"),
                            )),
                          ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Topics".toUpperCase(),
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade600)),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: state.item!.topics!
                            .map((e) => Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(e),
                                  ),
                                ))
                            .toList(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Description".toUpperCase(),
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade600)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        state.item?.description ?? "",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Language".toUpperCase(),
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade600)),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Text(
                            state.item?.language ?? "",
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
