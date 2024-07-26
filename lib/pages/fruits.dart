import 'package:flutter/material.dart';
import 'package:mycart/pages/cart.dart';
import 'package:mycart/pages/front.dart';
import 'package:mycart/pages/vegetable.dart';

import '../model/display_product.dart';
import '../model/my_product.dart';

class fruits extends StatefulWidget {
  const fruits({super.key});

  @override
  State<fruits> createState() => _fruitsState();
}

class _fruitsState extends State<fruits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(title:Text("Choose Fruits",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),backgroundColor: Colors.grey[350],),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 30,),
              fruits(),
              SizedBox(height: 100,),
            ],
          ),
        ),
      bottomSheet: BottomAppBar(
        height: 70,
        color: Colors.blue[100],
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> vegetable()));
            },child: Row(
              children: [
                Icon(Icons.arrow_back,color: Colors.blue,),
                SizedBox(width: 10,),
                Text("Previous",style: TextStyle(color: Colors.blue, fontSize: 25),),
              ],
            ),
            ),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> cart()));
            },child: Row(
              children: [
                Text("Cart",style: TextStyle(color: Colors.blue, fontSize: 25),),
                SizedBox(width: 10,),
                Icon(Icons.arrow_forward,color: Colors.blue,),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
  fruits()=>
      GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (100 / 130),
            crossAxisSpacing: 1,
            mainAxisSpacing: 16,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: MyProduct.fruit.length,
          itemBuilder: (context, index) {
            final vegetables = MyProduct.fruit[index];
            return display(product: vegetables);
          }
      );
}
