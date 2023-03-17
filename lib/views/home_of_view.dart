import 'package:flutter/material.dart';

import '../model/post_model.dart';
import 'home_view.dart';

Widget viewOfError(String error) {
  return Center(
    child: Text(error),
  );
}

Widget viewOfLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget viewOfLoaded(List<Post> items, bool isLoading) {
  return Stack(
    children: [
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return itemOfPost(items[index]);
        },
      ),
      (isLoading) ?
      viewOfLoading() : const SizedBox.shrink(),
    ],
  );
}

