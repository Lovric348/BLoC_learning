import 'package:bloc_learning/bloc/povrda/potvrda_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PracticeHomeScreen extends StatelessWidget {
  
  

  final TextEditingController _prvitextController = TextEditingController();
  final TextEditingController _drugitextController = TextEditingController();
  final TextEditingController _trecitextController = TextEditingController();
  PracticeHomeScreen({super.key}) {
    prvi = _prvitextController.text;
    drugi = _drugitextController.text;
    treci = _trecitextController.text;
  }

  late String prvi;
  late String drugi;
  late String treci;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<PotvrdaBloc, PotvrdaState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 210,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextField(
                      controller: _prvitextController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 210,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextField(
                      controller: _drugitextController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 210,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextField(
                      controller: _trecitextController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () {
                  PotvrdaBloc potvrdaBloc = BlocProvider.of<PotvrdaBloc>(context);
                  potvrdaBloc.add(ProvjeriUnos(
                    prviInputString: _prvitextController.text, drugiInputString: _drugitextController.text, treciInputString: _trecitextController.text,
                    ));
                    
                }, child: Text('POTVRDA')),
                SizedBox(height: 60,),
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    color: state.potvrda ? Colors.amber: Colors.cyan,
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
