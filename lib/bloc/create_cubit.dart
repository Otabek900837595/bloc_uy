
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutterpatternbloc2/service/http_service.dart';
import '../model/post_model.dart';
import '../service/http_service.dart';
import 'create_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInit());

  void apiPostCreate(Post post) async {
    emit(CreatePostLoading());
    final response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    if (response != null) {
      emit(CreatePostLoaded(isCreated: true));
    } else {
      emit(CreatePostError(error: "Couldn't create post"));
    }
  }
}