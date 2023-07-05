import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/colors/bloc/colors_bloc.dart';


class FunPage extends StatefulWidget {
  const FunPage({Key? key}) : super(key: key);

  @override
  State<FunPage> createState() => _FunPageState();
}

class _FunPageState extends State<FunPage> {
  GlobalKey<ScaffoldState> FunPageKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => ColorsBloc(),
      child: Scaffold(
        key: FunPageKey,
        body: BlocBuilder<ColorsBloc, ColorsState>(
            builder: (BuildContext context, state) {
          return Scaffold(
            backgroundColor: state.color,
            appBar: AppBar(
              backgroundColor: state.color,
              centerTitle: true,
              title: Text(
                'FUN PAGE',
                style: TextStyle(
                  color: state.colorTitle,
                  fontSize: 29,
                ),
              ),
            ),
            body: Container(
              height: screenHeight * 1,
              width: screenWidth * 1,
              child: Column(
                children: [
                  ElevatedButton(
                    child: Text(
                      "${state.number}",
                      style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      context.read<ColorsBloc>().add(ColorChangeEvent());
                    },
                  ),
                  ElevatedButton(
                      child: Text(
                        '0',
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        context.read<ColorsBloc>().add(ResetEvent());
                      }),
                  ElevatedButton(
                      child: Text(
                        '-1',
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        context.read<ColorsBloc>().add(DecreaseEvent());
                      }),
                  ElevatedButton(
                      child: Text(
                        'SERIOUS',
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/seriouspage');
                        
                          
                        
                      }),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
