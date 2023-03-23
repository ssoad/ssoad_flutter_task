import 'package:flutter/material.dart';

import '../../../../core/model/repository_list_response_model.dart';

class RepositoryItemCard extends StatelessWidget {
  final Item item;
  const RepositoryItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
        elevation: 3,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          height: height * 0.2,
          width: width * 0.95,
          child: MaterialButton(
            onPressed: () {},
            clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                          Text(
                            item.name!,
                            style: const TextStyle(fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 10, right: 10, bottom: 10),
                          child: Center(
                            child: Text(
                              item.description!,
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        )),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Stars'),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.fork_right_outlined, color: Colors.grey),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Fork'),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}