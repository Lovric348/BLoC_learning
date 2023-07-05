import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:bloc_learning/bloc/posts/models/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostsNavigateToSeriousPageEvent>(postsNavigateToSeriousPageEvent);
    
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsLoadingState());

    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post =
            PostDataUiModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      print(posts);
      emit(PostsLoadedState(posts: posts));
    } catch (e) {
      emit(PostsLoadingState());
      log(e.toString() as num);
    }
  }

  FutureOr<void> postsNavigateToSeriousPageEvent(
      PostsNavigateToSeriousPageEvent event, Emitter<PostsState> emit) {}

  
    
  }

