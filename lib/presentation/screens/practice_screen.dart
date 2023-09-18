import 'package:bloc_learning/bloc/povrda/potvrda_bloc.dart';
import 'package:bloc_learning/models/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PracticeHomeScreen extends StatelessWidget {
 
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<PotvrdaBloc, PotvrdaState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customTextField('email',
                    (value){
                      context.read<PotvrdaBloc>().add(EmailEvent(value));
                    } 
                     
                ),
                SizedBox(height: 70,),
                customTextField('Password',
                (value){
                      context.read<PotvrdaBloc>().add(PasswordEvent(value));
                    } 
                ),
                
                TextField()
              ],
            ),
          );
        },
      )),
    );
  }
}
