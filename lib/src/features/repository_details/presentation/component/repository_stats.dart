import 'package:flutter/material.dart';

import '../../../../core/model/repository_list_response_model.dart';
import '../../../../utils/dateUtils.dart';

class RepositoryInfo extends StatelessWidget {
  final Item? item;
  const RepositoryInfo({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
            item!.name!,
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
        "Last updated on : " + parseStringDate(item!.updatedAt!)!,
        style: const TextStyle(
            fontSize: 16, color: Colors.grey, fontStyle: FontStyle.italic),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Watchers: ${item!.watchersCount}"),
        )),
        const SizedBox(
          width: 20,
        ),
        Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Forks: ${item!.forksCount}"),
        )),
        const SizedBox(
          width: 20,
        ),
        Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Stars: ${item!.stargazersCount}"),
        )),
      ]),
      const SizedBox(
        height: 20,
      ),
      Text("Topics".toUpperCase(),
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
      const SizedBox(
        height: 10,
      ),
      Wrap(
        alignment: WrapAlignment.center,
        children: item!.topics!
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
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
      const SizedBox(
        height: 10,
      ),
      Text(
        item?.description ?? "",
        style: TextStyle(fontSize: 20, color: Colors.black),
        textAlign: TextAlign.justify,
      ),
      const SizedBox(
        height: 20,
      ),
      Text("Language".toUpperCase(),
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
      const SizedBox(
        height: 10,
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Text(
            item?.language ?? "",
            style: const TextStyle(fontSize: 18, color: Colors.black),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    ]);
  }
}
