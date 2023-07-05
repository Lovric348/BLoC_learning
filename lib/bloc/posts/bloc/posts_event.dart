part of 'posts_bloc.dart';

abstract class PostsEvent {
   
}
class PostsInitialFetchEvent extends PostsEvent{}

class PostsNavigateToSeriousPageEvent extends PostsEvent {}

class PostsAddEvent extends PostsEvent {}