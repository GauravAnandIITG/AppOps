import 'package:flutter/material.dart';
import 'package:mycart/model/display_product.dart';
import 'package:mycart/pages/front.dart';
import 'package:mycart/pages/fruits.dart';
import 'package:flutter/cupertino.dart';

import '../model/my_product.dart';

class vegetable extends StatefulWidget {
  const vegetable({super.key});

  @override
  State<vegetable> createState() => _vegetableState();
}

class _vegetableState extends State<vegetable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title:Text("Choose Vegetables",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),backgroundColor: Colors.grey[350],),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 30,),
            vegetable(),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> front()));
                      },child: Row(
                        children: [
                          Icon(Icons.arrow_back,color: Colors.blue,),
                          SizedBox(width: 10,),
                          Text("Previous",style: TextStyle(color: Colors.blue, fontSize: 25),),
                        ],
                      ),
                      ),
                  TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> fruits()));
                      },child: Row(
                        children: [
                          Text("Next",style: TextStyle(color: Colors.blue, fontSize: 25),),
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
  vegetable()=>
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
      itemCount: MyProduct.vegetable.length,
      itemBuilder: (context, index) {
        final vegetables = MyProduct.vegetable[index];
        return display(product: vegetables);
      }
  );
}
