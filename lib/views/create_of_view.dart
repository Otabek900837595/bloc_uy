
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_cubit.dart';
import '../model/post_model.dart';

TextEditingController nameContoller = TextEditingController();
TextEditingController bodyController = TextEditingController();

Widget viewOfCreate(context, bool isLoading) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: nameContoller,
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
            ),

            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){

                String name = nameContoller.text.trim();
                Post post = Post(name: name,);
                BlocProvider.of<CreatePostCubit>(context).apiPostCreate(post);
              },
              child: const Text("Create"),
            ),
          ],
        ),
        (isLoading) ?
        const Center(
          child: CircularProgressIndicator(),
        ) : const SizedBox(),
      ],
    ),
  );
}