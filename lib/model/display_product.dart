import 'package:flutter/material.dart';
import 'package:mycart/model/cart_provider.dart';
import 'product.dart';

class display extends StatefulWidget {
  final Product product;
  const display({super.key, required this.product});

  @override
  State<display> createState() => _displayState();
}

class _displayState extends State<display> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Container(
      margin: EdgeInsets.only(left: 14,right: 14),
      width: MediaQuery.of(context).size.width/2,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
      child:  Column(
        children: [
          SizedBox(
            height: 140,
            width: 140,
            child: Image.asset(widget.product.image,height: 140,width: 140,),
          ),
          Text(widget.product.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Text("\₹ "'${widget.product.price} /kg',style: TextStyle(fontSize: 16),),
          SizedBox(height: 10,),
          GestureDetector(onTap: (){
            provider.toggleProduct(widget.product);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.redAccent , content: Text("Added Successfully"),duration: Duration(milliseconds:50),));
          },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Add to cart",style: TextStyle(color: Colors.orange[800],fontSize: 14,fontWeight: FontWeight.bold),),
                  Icon(Icons.add_shopping_cart,color: Colors.black,)
                ],
              ))
        ],
      ),
    );
  }
}
