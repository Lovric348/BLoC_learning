import 'package:bloc_learning/models/korisnik.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class KorisnikHomeScreen extends StatefulWidget {
  List<Korisnik> korisnici =
  
  [Korisnik(ime: 'Mato', prezime: 'Basic', godine: 28),
  Korisnik(ime: 'Pejo', prezime: 'Crnoja', godine: 38),
  Korisnik(ime: 'Ivo', prezime: 'Jaje', godine: 23)
  ]; 
  KorisnikHomeScreen({super.key});

  @override
  State<KorisnikHomeScreen> createState() => _KorisnikHomeScreenState();
}

class _KorisnikHomeScreenState extends State<KorisnikHomeScreen> {
  final korisnik = FirebaseAuth.instance.currentUser!;

  List<String> docIds= [];
  Future getDocIds() async{
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection('korisnici').get();
    print(querySnapshot);
  }

  @override
  void initState() {
    getDocIds();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
             child: ListView.builder(
              itemCount: 40,
              itemBuilder: (BuildContext context, int index){
                return Text('kads');
              }
               
               ),
          ),
        ),
      ),);
  }
}