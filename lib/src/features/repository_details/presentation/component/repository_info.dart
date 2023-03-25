import 'package:flutter/material.dart';

import '../../../../core/constants/text_styles.dart';
import '../../../../core/model/repository_list_response_model.dart';
import '../../../../utils/dateUtils.dart';

class RepositoryInfo extends StatelessWidget {
  final Item? item;
  const RepositoryInfo({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
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
              style: bold30,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        Title(
          "Last updated on : ${parseStringDate(item!.updatedAt!)!}",
        ),
        Wrap(alignment: WrapAlignment.spaceBetween, children: [
          StatsCard("Watchers", item!.watchersCount!),
          StatsCard("Forks", item!.forksCount!),
          StatsCard("Stars", item!.stargazersCount!),
        ]),
        Title("Topics".toUpperCase()),
        Wrap(
          alignment: WrapAlignment.center,
          children: item!.topics!.map((e) => TopicsCard(e)).toList(),
        ),
        Title("Description"),
        Text(
          item?.description ?? "",
          style: regular20,
          textAlign: TextAlign.justify,
        ),
        LanguageCard(item!.language ?? "No Language"),
      ]),
    );
  }

  // ignore: non_constant_identifier_names
  Widget StatsCard(String title, int count) {
    return Card(
        elevation: 0,
        shape: const StadiumBorder(),
        color: Colors.blueGrey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("$title: $count"),
        ));
  }

  // ignore: non_constant_identifier_names
  Widget TopicsCard(String title) {
    return Card(
        elevation: 0,
        shape: const StadiumBorder(),
        color: Colors.blue.shade300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: regular21white),
        ));
  }

  Widget LanguageCard(String title) {
    return Column(
      children: [
        Title(
          "Languages".toUpperCase(),
        ),
        Card(
            elevation: 1,
            shape: const StadiumBorder(),
            color: const Color(0xFF5CC3F0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(title, style: regular21white),
            )),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget Title(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Text(title.toUpperCase(), style: sectionHeading),
    );
  }
}
