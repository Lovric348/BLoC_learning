import 'package:flutter/material.dart';

Widget customTextField(
  final String hintext,
  void Function(String value)? func,
  ){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 210,
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2,
          color: Colors.black),
          borderRadius: BorderRadius.circular(5.0)),
        child: SizedBox(
          height: 40,
          width: 190,
          child: TextField(
            onChanged: (value) =>func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintext,
              
            ),
          ),),),
    );
  }
