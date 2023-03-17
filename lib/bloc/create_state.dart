
import 'package:equatable/equatable.dart';

abstract class CreatePostState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreatePostInit extends CreatePostState {}

class CreatePostLoading extends CreatePostState {}

class CreatePostLoaded extends CreatePostState {
  bool? isCreated;
  CreatePostLoaded({this.isCreated});
}

class CreatePostError extends CreatePostState {
  String? error;
  CreatePostError({this.error});
}