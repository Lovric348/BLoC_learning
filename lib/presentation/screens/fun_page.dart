import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/colors/bloc/colors_bloc.dart';



class FunPage extends StatelessWidget {
  const FunPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorsBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<ColorsBloc, ColorsState>(
         builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: state.color,
              centerTitle: true,
              title: Text(
                'FUN PAGE',
                style: TextStyle(
                  color: state.colorTitle,
                  fontSize: 29,
                ),),
            ),
          );

         }),
      
      ),
    );
    
  }
}