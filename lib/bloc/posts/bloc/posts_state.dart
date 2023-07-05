part of 'posts_bloc.dart';

abstract class PostsState {}

abstract class PostsActionState extends PostsState{}

class PostsInitial extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsLoadedState extends PostsState {
  final List<PostDataUiModel> posts;
  PostsLoadedState({
    required this.posts,
  });
}

class PostsNavigateToSeriousPageState extends PostsActionState {}
