import 'package:flutter/material.dart';

class FeatureThree extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
        body: Container(
        color: Colors.white,
        width: double.infinity,
        child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
                Image.asset("assets/Vision Mate.png" , ),
                SizedBox(height: 20),
                Image.asset("assets/FeatureThree.png" ,),

                SizedBox(height: 25,),
                Text("Objective Detiction",
                    style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
          textAlign: TextAlign.center,
        ),
                ],

                SizedBox(height: 20,),
                Text(
                  "Identifies the presence of various"
                      " \n objects in your environment,"
                      " \n assisting in real-time detection of them,"
                      "\n  ensuring trust and safety.",
                  style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),

            SizedBox(height: 60,),

        ],
            )
        )

    ));
  }
}



