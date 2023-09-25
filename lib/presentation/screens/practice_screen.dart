import 'package:bloc_learning/bloc/cubit/trazi_cubit.dart';
import 'package:bloc_learning/models/listaHashtagova.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PracticeHomeScreen extends StatelessWidget {
  
  final ListaHashtagova listaHashtagova = ListaHashtagova();

  @override
  Widget build(BuildContext context) {
    final TraziCubit traziCubit = BlocProvider.of<TraziCubit>(context);
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<TraziCubit, List<String>>(
          builder: (context, istiStringovi) {
            return Container(
              color: Colors.pink,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 170,
                    child: TextField(
                      onChanged: (query)=> traziCubit.traziStringove(query),
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
                      itemCount: istiStringovi.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Text(istiStringovi[index]),
                        );
                      }))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
