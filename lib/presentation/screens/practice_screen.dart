
import 'package:bloc_learning/models/listaHashtagova.dart';
import 'package:bloc_learning/models/trazilica.dart';
import 'package:flutter/material.dart';


class PracticeHomeScreen extends StatelessWidget {
  final ListaHashtagova listaHashtagova = ListaHashtagova();
  
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: (){
                showSearch(context: context, 
                delegate: Trazilica());
              }, 
              icon: Icon(Icons.search))
          ],
        ),
      ),
    );
  }
}
