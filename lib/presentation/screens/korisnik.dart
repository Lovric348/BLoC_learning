import 'package:bloc_learning/models/korisnik.dart';
import 'package:bloc_learning/widgets/korisnik_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class KorisnikHomeScreen extends StatefulWidget {
  
  /* [
    Korisnik(ime: 'Mato', prezime: 'Basic', godine: 28),
    Korisnik(ime: 'Pejo', prezime: 'Crnoja', godine: 38),
    Korisnik(ime: 'Ivo', prezime: 'Jaje', godine: 23)
  ]; */
  KorisnikHomeScreen({super.key});

  @override
  State<KorisnikHomeScreen> createState() => _KorisnikHomeScreenState();
}

class _KorisnikHomeScreenState extends State<KorisnikHomeScreen> {
  List<Korisnik> korisnici = [];
  Future<Korisnik> getDocIds() async {
    String ime = '';
    String prezime = '';
    int godine = 0;
    try{
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance.collection('korisnici').doc().get();
    ime = docSnapshot['ime'];
    prezime = docSnapshot['prezime'];
    godine = docSnapshot['godine'];
    }
        
    on FirebaseException {
    // sto ako bude error
  }
  return Korisnik(ime: ime, prezime: prezime, godine: godine);
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
              itemCount: korisnici.length,
              itemBuilder: (BuildContext context, index) {
                return KorisnikWidget(korisnik: korisnici[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
} 
