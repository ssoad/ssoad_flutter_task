import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/model/repository_list_response_model.dart';

class OwnerInfo extends StatelessWidget {
  final Item? item;
  const OwnerInfo({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade100,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: CachedNetworkImage(
              imageUrl: item?.owner?.avatarUrl ?? "",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(item?.owner?.login!.toUpperCase() ?? "",
              style: const TextStyle(
                  fontSize: 20, color: const Color(0xff3C4043))),
        ],
      ),
    );
  }
}
