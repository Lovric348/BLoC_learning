import 'package:bloc_learning/service/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class KorisnikHomeScreen extends StatefulWidget {
  
  KorisnikHomeScreen({super.key});

  @override
  State<KorisnikHomeScreen> createState() => _KorisnikHomeScreenState();
}

class _KorisnikHomeScreenState extends State<KorisnikHomeScreen> {
  FirestoreService firestoreService = FirestoreService();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
          
        body: Padding(
          
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: StreamBuilder<QuerySnapshot>(
              stream: firestoreService.procitajKorisnike(),
              builder: (context, snapshot) {
                //ako imamo podatke pokazi ih
                if (snapshot.hasData) {
                  List korisniciLista = snapshot.data!.docs;
                  print(korisniciLista);
                  //prikazi kao listu
                  return ListView.builder(
                    itemCount: korisniciLista.length,
                    itemBuilder: (context, index) {
                      //dohvati svaki individualni dokument
                      DocumentSnapshot dokument = korisniciLista[index];
                      String docId = dokument.id;

                      //dohvati podatke iz svakog dokumenta
                      Map<String, dynamic> data = 
                      dokument.data() as Map<String, dynamic>;
                      String imeText = data['ime'];
                      

                      //prikazi na UI
                      return ListTile(
                        title: Text(imeText),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: ()=> firestoreService.obrisiKorisnika(docId)),
                      );

                    });
                } else {
                  return const Text('no data');
                }
              },),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          onPressed: (){
           firestoreService.checkFirestoreConnection();
          },
      ),
      ),
    );
  }
} 
