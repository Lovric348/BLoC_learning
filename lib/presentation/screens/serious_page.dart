import 'package:bloc_learning/bloc/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriousPage extends StatefulWidget {
  const SeriousPage({super.key});

  @override
  State<SeriousPage> createState() => _SeriousPageState();
}

class _SeriousPageState extends State<SeriousPage> {
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
                child: CircularProgressIndicator(),
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
