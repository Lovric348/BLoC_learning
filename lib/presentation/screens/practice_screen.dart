import 'package:flutter/material.dart';

class PracticeHomeScreen extends StatelessWidget {
 PracticeHomeScreen({super.key});
 
 final TextEditingController _prvitextController = TextEditingController();
 final TextEditingController _drugitextController = TextEditingController();
 final TextEditingController _trecitextController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                
                   Padding(
                    
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                      height: 50,
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        controller: _prvitextController,
                        decoration: InputDecoration(
                          
                        ),
                      ),
                      
                                     ),
                   ),
                   Padding(
                    
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                      height: 50,
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        controller: _drugitextController,
                        decoration: InputDecoration(
                          
                        ),
                      ),
                      
                                     ),
                   ),
                   Padding(
                    
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                      height: 50,
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        controller: _trecitextController,
                        decoration: InputDecoration(
                          
                        ),
                      ),
                      
                                     ),
                   ),
                
          ],)
      ),);
  }
}