import 'package:bloc_learning/bloc/colors/bloc/colors_bloc.dart';
import 'package:bloc_learning/bloc/posts/bloc/posts_bloc.dart';
import 'package:bloc_learning/presentation/screens/details_page.dart';
import 'package:bloc_learning/presentation/screens/fun_page.dart';
import 'package:bloc_learning/presentation/screens/serious_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppRouter {
  final ColorsBloc _colorsBloc= ColorsBloc();
  final PostsBloc _postsBloc= PostsBloc();

  Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name) {
      case '/': 
      return MaterialPageRoute(
        builder:(_) => BlocProvider.value(
        value: _colorsBloc,
        child: FunPage(),
        ), );
        
      
      case '/seriouspage': 
      return MaterialPageRoute(
        builder:(_) => BlocProvider.value(
        value: _colorsBloc,
        child: SeriousPage(),
        
        ), );

      case '/detailspage': 
      return MaterialPageRoute(
        builder:(_) => BlocProvider.value(
        value: _postsBloc,
        child: DetailsPage(),
        ), );
        
      
      default: 
      return null;
    }
      
        
        
    }
    void dispose(){
      _colorsBloc.close();
      
    }
  }
