import 'package:flutter/material.dart';

class terms extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Image.asset(
          'assets/images/blaksid.png',
          height: 40,
        ),
      ),
      body:SingleChildScrollView(
       child: Column(
         children: [
             Text("Terms and services",
            style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 30,
            ),
            
        ),
        Text("Welcome to Cokut!",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        ),
         Container(
          color: Colors.white,
          height: 10,
        ),
        Text("These terms and conditions outline the rules and regulations for the use of cokut's Application."),
        Container(
          color: Colors.white,
          height: 10,
        ),
        Text("By accessing this website we assume you accept these terms and conditions. Do not continue to use Website Name if you do not agree to take all of the terms and conditions stated on this page."),
       

         ],
       ),
      ),
     backgroundColor: Colors.white, 
    
    
      
     
       
      );
     
    
  }

}