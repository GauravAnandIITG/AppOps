import 'package:flutter/material.dart';
import 'package:mycart/pages/vegetable.dart';

class front extends StatefulWidget {
  const front({super.key});

  @override
  State<front> createState() => _frontState();
}

class _frontState extends State<front> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 50,left: 5,right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Image.asset("assests/3565075.jpg"),
            Center(child: Text("Delivering Freshness\n   To Your Doorstep !" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),)),
            Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(top:30),
                decoration: BoxDecoration( color: Colors.green, borderRadius : BorderRadius.circular(20),),
                child: TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> vegetable()));
                },child: Text("Get Started",style: TextStyle(color: Colors.white, fontSize: 25),),


                )

            )],

          )
      ),


    );
  }
}
// TODO Im