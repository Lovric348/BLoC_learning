import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/colors/bloc/colors_bloc.dart';

class FunPage extends StatelessWidget {
  const FunPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => ColorsBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<ColorsBloc, ColorsState>(
            builder: (BuildContext context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                Navigator.pushNamed(context, '/seriouspage');
                
              }),
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
              child: 
                  Stack(
                    children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'How many news would \nyou like to read?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: state.colorTitle,
                            ),
                          )),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.6,
                          child: Stack(
                            children: [
                              SizedBox(
                                width: screenWidth * 1,
                                height: screenHeight * 1,
                                child: FloatingActionButton(
                                  child: Text(
                                    "${state.number}",
                                    style: TextStyle(
                                      fontSize: 29,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<ColorsBloc>()
                                        .add(ColorChangeEvent());
                                  },
                                  splashColor: Color.fromARGB(255, 6, 84, 147),
                                ),
                              ),
                              Container(
                                width: screenWidth * 0.3,
                                height: screenHeight * 0.2,
                                child: FloatingActionButton(
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: 29,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    splashColor: Colors.black87,
                                    elevation: 5,
                                    backgroundColor: Colors.grey,
                                    onPressed: () {
                                      context
                                          .read<ColorsBloc>()
                                          .add(ResetEvent());
                                    }),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: screenWidth * 0.4,
                                  height: screenHeight * 0.4,
                                  child: FloatingActionButton(
                                      child: Text(
                                        '-1',
                                        style: TextStyle(
                                          fontSize: 29,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      splashColor:
                                          Color.fromARGB(221, 9, 101, 29),
                                      elevation: 5,
                                      backgroundColor:
                                          Color.fromARGB(255, 140, 239, 104),
                                      onPressed: () {
                                        context
                                            .read<ColorsBloc>()
                                            .add(DecreaseEvent());
                                            
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                
            ),
          );
        }),
      ),
    );
  }
}
