import 'package:bloc_learning/bloc/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SeriousPage extends StatefulWidget {
  const SeriousPage({Key? key}) : super(key: key);

  @override
  State<SeriousPage> createState() => _SeriousPageState();
}

class _SeriousPageState extends State<SeriousPage>{
  
  final PostsBloc postsBloc = PostsBloc();
  @override
  void initState() {
    postsBloc.add(PostsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SERIOUS PAGE'),
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listenWhen: (previous, current) => current is PostsActionState,
        buildWhen: (previous, current) => current is! PostsActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case PostsLoadingState:
              return Center(
                child: Lottie.network('https://lottie.host/124f055b-597b-438b-ab5a-232e73c74a5e/lDBLCV2l10.json'),
              );
            case PostsLoadedState:
              final successState = state as PostsLoadedState;

              return Container(
                  child: ListView.builder(
                    itemCount: successState.posts.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/detailspage');
                        },
                        child: Container(
                          color: Color.fromARGB(255, 159, 187, 236),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                successState.posts[index].title,
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                              Text(successState.posts[index].body),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                
              );

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
