
import 'package:bloc_uy/bloc/update_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/post_model.dart';
import '../pages/create_page.dart';
import '../pages/update_page.dart';
import '../service/http_service.dart';
import 'create_cubit.dart';
import 'home_state.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit() : super(ListPostInit());

  void apiPostList() async {
    emit(ListPostLoading());
    final response = await Network.GET(Network.API_LIST, {});
    if (response != null) {
      emit(ListPostLoaded(posts: Network.parsePostList(response)));
    } else {
      emit(ListPostError(error: "No data"));
    }
  }

  void apiPostDelete(Post post) async {
    emit(ListPostLoading());
    final response = await Network.DEL(Network.API_DELETE + post.id.toString(), {});
    if (response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: "Couldn't delete post"));
    }

  }

  void callCreatePage(BuildContext context, ) async {
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context) =>
        BlocProvider(
          create: (context) => CreatePostCubit(),
          child: const CreatePage(),
        )));
    if (result != null) {
      apiPostList();
    }
  }

  void callUpdatePage(BuildContext context, Post post) async {
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context) =>
        BlocProvider(
          create: (context) => UpdatePostCubit(),
          child: UpdatePage(post: post),
        )));
    if (result != null) {
      apiPostList();
    }
  }
}
