
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutterpatternbloc2/bloc/create_cubit.dart';

import '../bloc/create_cubit.dart';
import '../bloc/create_state.dart';
import '../model/post_model.dart';
// import '../view/create_of_view.dart';
import '../views/create_of_view.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  void _finish(BuildContext context, bool isCreated) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.pop(context, isCreated);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create"),
      ),
      body: BlocBuilder<CreatePostCubit, CreatePostState>(
        builder: (context, state) {
          if (state is CreatePostLoading) {
            return viewOfCreate(context, true);
          }
          if (state is CreatePostLoaded) {
            _finish(context, state.isCreated!);
          }
          if (state is CreatePostError) {
            return viewOfCreate(context, false);
          }
          return viewOfCreate(context, false);
        },
      ),
    );
  }

}