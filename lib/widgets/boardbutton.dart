import 'package:flutter/material.dart';

class Boardbutton extends StatelessWidget {
  String btnText;
  Function btnCLickCallBack;
  int position;
  Boardbutton(this.btnText, this.btnCLickCallBack,this.position);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blueGrey[100], 
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
              btnCLickCallBack(position);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, 
            foregroundColor: Colors.black, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), 
            ),
            padding: EdgeInsets.all(30),
            elevation: 0, 
          ),
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
