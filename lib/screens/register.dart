import 'package:flutter/material.dart';
import 'package:vision_mate/screens/loginScreen.dart';

class register extends StatelessWidget {

  var formkey = GlobalKey<FormState>();
  var emailcontroler = TextEditingController();
  var passwordcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Welcome",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40),
            textAlign: TextAlign.center,

          ),
          SizedBox(
            height: 100,
          ),

          SizedBox(
            width: 430,
            height: 70,
            child:
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter your Email",
                  border: OutlineInputBorder (
                    borderRadius:
                    BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[0],
                  filled: true,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                ),



                controller: emailcontroler,
                validator: (value){
                  if(value!.isEmpty || value == null){
                    return "Enter your Email";
                  }else if (!value.contains("@")){
                    return "Invalid your Email";
                  }else {
                    return null;
                  }
                }
            ),),

          SizedBox(height: 15,),

          SizedBox(
            width: 430,
            height: 70,
            child:
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Password",
                  border: OutlineInputBorder (
                    borderRadius:
                    BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[0],
                  filled: true,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                ),
                obscureText: true,

                controller: passwordcontroler,
                validator: (value){
                  if(value!.isEmpty || value == null){
                    return "Enter Password";
                  }else if (value.length<6){
                    return "Your password should me more than 6";
                  }else
                    return "Done";
                }

            ),),
          SizedBox(height: 30),

          ElevatedButton(onPressed: () {} ,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
              padding:
              EdgeInsets.symmetric(horizontal: 180, vertical: 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text("Sign up",
                style: TextStyle(color: Colors.white,
                    fontSize:20)),
          ),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                  style: TextStyle(color: Colors.black),),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> loginScreen()));
                }, child: Text("Sign In",
                  style: TextStyle(color: Colors.blue),),
                ),
              ]
          ),
        ],
      ),
    );

  }
}