import 'package:bloc_learning/models/listaHashtagova.dart';
import 'package:flutter/material.dart';


class Trazilica extends SearchDelegate {
  ListaHashtagova listaHashtagova = ListaHashtagova();
  List<String> pojmovi = ['Audi', 'Alfa Romeo', 'BMW', 'Toyota', 'Mercedes', 'Mini', 'Opel', 'Tata', 'Nissan', 'Kia', 'Hyundai'];

  @override
  Widget? buildLeading(BuildContext context) {
    return 
      IconButton(
      onPressed: (){
        query= '';
      }, 
      icon: Icon(Icons.clear));

    
  }
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[ IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    ),
    ];
  }
  
  @override
  Widget buildResults(BuildContext context) {
    List<String> istiStringovi = [];
    
    for (var pojam in listaHashtagova) {
      if(pojam.toLowerCase().contains(query.toLowerCase())){
        istiStringovi.add(pojam);
      }
    }
    return ListView.builder(
      itemCount: istiStringovi.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(istiStringovi[index]),
        );
      });
    
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> istiStringovi = [];

    for(var pojam in listaHashtagova) {
      if(pojam.toLowerCase().contains(query.toLowerCase())){
        istiStringovi.add(pojam);
      }
    }
    return ListView.builder(
      itemCount: istiStringovi.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(istiStringovi[index]),
        );
      });
  }
}

