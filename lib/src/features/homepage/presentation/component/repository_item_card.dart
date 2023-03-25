import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/model/repository_list_response_model.dart';
import '../../../../utils/routes.dart';

class RepositoryItemCard extends StatelessWidget {
  final Item item;
  const RepositoryItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: MaterialButton(
        onPressed: () {
          Get.toNamed(Routes.details, arguments: item);
        },
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(2),
          height: height * 0.14,
          width: width * 0.9,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.book,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          item.fullName!,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black87),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //     flex: 3,
                //     child: Padding(
                //       padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
                //       child: Center(
                //         child: Text(
                //           item.description ?? "",
                //           style: TextStyle(fontSize: 15),
                //           textAlign: TextAlign.justify,
                //         ),
                //       ),
                //     )),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Stars: ${item.stargazersCount!}'),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.fork_right_outlined, color: Colors.grey),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Fork: ${item.forksCount!}'),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
