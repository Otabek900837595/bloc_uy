
import 'dart:convert';

import 'package:bloc_uy/bloc/update_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../model/post_model.dart';
import '../service/http_service.dart';
import '../views/create_of_view.dart';
import '../views/update_view.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit() : super(UpdatePostInit());


  void apiPostUpdate(Post post) async {
    emit(UpdatePostLoading());
    final response = await Network.PUT(Network.API_UPDATE + post.id!, Network.paramsUpdate(post));
    if (response != null) {
      emit(UpdatePostLoaded(isUpdated: true));
    } else {
      emit(UpdatePostError(error: "kallang joyidami sani aaaaaaaa!!!!!!!!!!!!!!!!!!!!!!!!!"));
    }
  }


  void doUpdate() {

    String name = nameContoller.text.trim();
    Post post = Post(name: name);

    Network.POST(Network.API_CREATE, Network.paramsUpdate(post)).then((value) => {
      post = Post.fromJson(jsonDecode(value!)),
    });
  }

}










