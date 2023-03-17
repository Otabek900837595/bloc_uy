// import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/update_cubit.dart';
import '../model/post_model.dart';
import 'create_of_view.dart';

// TextEditingController userIdController = TextEditingController();
// TextEditingController titleController = TextEditingController();
TextEditingController nameController = TextEditingController();
// TextEditingController bodyController = TextEditingController();


Widget viewOfUpdate(context, bool isLoading, Post postOut) {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text("body"),
                ),
              ),
            ),

            MaterialButton(
              onPressed: (){
                String title = nameContoller.text.trim();
                Post post = Post(id: postOut.id, name: postOut.name);
                BlocProvider.of<UpdatePostCubit>(context).apiPostUpdate(post);
              },
              minWidth: double.infinity,
              color: Colors.blue,
              child: const Text("Update", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
      (isLoading) ?
      const Center(
        child: CircularProgressIndicator(),
      ) : const SizedBox(),
    ],
  );
}