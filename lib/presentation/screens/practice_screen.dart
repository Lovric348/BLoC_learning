import 'package:bloc_learning/bloc/bloc/pretrazi_bloc.dart';
import 'package:bloc_learning/models/listaHashtagova.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PracticeHomeScreen extends StatelessWidget {
  final ListaHashtagova listaHashtagova = ListaHashtagova();
  final String value = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<PretraziBloc, PretraziState>(
        builder: (context, state) {
          return Container(
            color: Colors.pink,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 555,
                  child: TextField(
                    onChanged: (value1) {
                      value1 = value;
                      } ,
                    decoration: InputDecoration(
                        fillColor: Colors.amber,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 3,
                        ))),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: state.istiStringovi.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.istiStringovi[index]),
                          );
                        })),
                        ElevatedButton(
                          onPressed: (){
                            
                      context.read<PretraziBloc>().add(PretragaHashtagovaEvent(value));
                          }, child: Text('trazi')),
              ],
            ),
          );
        },
      )),
    );
  }
}
