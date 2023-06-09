import 'package:equatable/equatable.dart';

abstract class UpdatePostState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class UpdatePostInit extends UpdatePostState {}

class UpdatePostLoading extends UpdatePostState {}

class UpdatePostLoaded extends UpdatePostState {
  bool? isUpdated;
  UpdatePostLoaded({this.isUpdated});
}

class UpdatePostError extends UpdatePostState {
  String? error;
  UpdatePostError({this.error});
}