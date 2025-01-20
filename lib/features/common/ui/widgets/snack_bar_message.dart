import 'package:flutter/material.dart';

void showSnackBarMessage(BuildContext context, String message, [bool isErrorMessage = false]) {
  final snackBar = SnackBar(
    content: Text(message,style: TextStyle(
      color: isErrorMessage? Colors.white:null,
    ),),
    backgroundColor: isErrorMessage ? Colors.red : Colors.green, // Optional: Change color based on error
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
