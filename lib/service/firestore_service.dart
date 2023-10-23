import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService {
  //dohvatiti kolekciju "korisnici"
  final CollectionReference korisnici = 
  FirebaseFirestore.instance.collection('korisnici');

  //napravi korisnika
  Future<void> dodajKorisnika(String ime, String prezime, int godine) {
    return korisnici.add({
      'ime': ime,
      'prezime': prezime,
      'godine': godine,
      'timestamp': Timestamp.now(),
    });
  }

  //procitaj korisnike 
  Stream<QuerySnapshot> procitajKorisnike() {
    final korisnikStream = 
    korisnici.snapshots();
    
    return korisnikStream;
    
  }

  //updateaj korisnika

  //obrisi korisnika
  Future<void> obrisiKorisnika(String docId) {
    return korisnici.doc(docId).delete();
  }

   void checkFirestoreConnection() async {
  final firestore = FirebaseFirestore.instance;

  try {
    await firestore.collection('korisnici').get();
    print('Firestore connection successful');
  } catch (e) {
    print('Error connecting to Firestore: $e');
  }
}
}