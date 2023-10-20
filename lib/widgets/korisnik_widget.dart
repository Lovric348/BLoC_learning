import 'package:bloc_learning/models/korisnik.dart';
import 'package:flutter/material.dart';
class KorisnikWidget
 extends StatelessWidget {
  final Korisnik korisnik;
  const KorisnikWidget
  ({super.key, required this.korisnik});

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: (){
        
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 80,
        width: 20,
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.yellow),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(korisnik.ime),
            SizedBox(height: 10,),
            Text(korisnik.prezime),
            Text(korisnik.godine.toString()),
          ],
        ),
        ),
      ),
    );
  }
}