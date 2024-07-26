import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mycart/model/cart_provider.dart';
import 'package:mycart/pages/order.dart';

    class cart extends StatefulWidget {
      const cart({super.key});

      @override
      State<cart> createState() => _cartState();
    }

    class _cartState extends State<cart> {
      @override
      Widget build(BuildContext context) {
        final provider = CartProvider.of(context);
        final finalList =provider.cart;
        _buildProductQuantity(IconData icon, int index){
          return GestureDetector(
            onTap: (){
              setState(() {
                icon== Icons.add?
                provider.incrementQuantity(index)
                    : provider.decrementQuantity(index);
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red[100]
              ),
              child: Icon(icon,size: 20,),
            ),
          );
        }
        return Scaffold(
            appBar: AppBar(title: Text("My Cart",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,),),
              backgroundColor: Colors.grey[350],),
            backgroundColor: Colors.grey[200],
            body: Column(
              children: [
                SizedBox(height: 20,),
                Expanded(child: ListView.builder(
                    itemCount: finalList.length,
                    itemBuilder:(context,index){
                      return Padding(padding: EdgeInsets.all(5),
                        child: Slidable(
                          endActionPane:ActionPane(motion: const ScrollMotion(), children: [
                            SlidableAction(onPressed: (context){
                              finalList.removeAt(index);
                              setState(() {
                              });
                            },
                              icon: Icons.delete,
                              label: "Delete",
                              backgroundColor: Colors.red,
                            )]) ,
                          child: ListTile(
                            title: Text(finalList[index].name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            subtitle: Text("\₹${finalList[index].price}",overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(finalList[index].image,),
                              backgroundColor: Colors.blue[100],
                            ),
                            trailing: ClipRect(
                              child: Column(
                                children: [
                                  _buildProductQuantity(Icons.add, index),
                                  Text(finalList[index].quantity.toString(),style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
                                  _buildProductQuantity(Icons.remove, index),
                                ],
                              ),
                            ),
                            tileColor: Colors.white,
                          ),
                        ),
                      );
                    })),
              ],


            ),
            bottomSheet: BottomAppBar(
              color: Colors.blue[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\₹${provider.getTotalPrice()}",
                    style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                  ElevatedButton.icon(onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => order()));
                  }, icon: Icon(Icons.send), label: Text("Check out"))
                ],
              ),
            ),
          );
        }
      }




























