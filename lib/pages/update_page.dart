
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/update_cubit.dart';
import '../bloc/update_state.dart';
import '../model/post_model.dart';
import '../service/http_service.dart';
// import '../view/update_view.dart';
import '../views/update_view.dart';

class UpdatePage extends StatefulWidget {
  final Post? post;
  const UpdatePage({Key? key, this.post}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {


  void _finish(BuildContext context, bool isUpdated) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.pop(context, isUpdated);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update"),
      ),
      body:BlocBuilder<UpdatePostCubit, UpdatePostState>(
        builder: (context, state) {
          if (state is UpdatePostLoading) {
            return viewOfUpdate(context, true, widget.post!);
          }
          if (state is UpdatePostLoaded) {
            _finish(context, state.isUpdated!);
          }
          if (state is UpdatePostError) {
            return viewOfUpdate(context, false, widget.post!);
          }
          return viewOfUpdate(context, false, widget.post!);
        },
      ),
    );
  }

}
