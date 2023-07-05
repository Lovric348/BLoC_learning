

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation/route.dart';
import 'bloc/colors/bloc/colors_bloc.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter appRouter= AppRouter();
    
 
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorsBloc(),
      child: 
    
     MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.onGenerateRoute,
      
),
     
     );
}
    
      
    
  
@override void dispose() {
  appRouter.dispose();
    super.dispose();
  }
  
}
