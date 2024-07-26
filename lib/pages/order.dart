import 'package:flutter/material.dart';
import 'package:mycart/pages/front.dart';
import 'package:mycart/pages/vegetable.dart';

class order extends StatefulWidget {
  const order({super.key});

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 60,),
          Center(child: Image.asset("assests/pngwing.png"),),
          Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(top:30),
              decoration: BoxDecoration( color: Colors.blue[900], borderRadius : BorderRadius.circular(20),),
              child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>vegetable()));
              },child: Text("Continue Shopping",style: TextStyle(color: Colors.white, fontSize: 25),),
              )
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }
}
