import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mycart/pages/Login.dart';
import 'package:mycart/pages/vegetable.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override

  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  String? name,email,password;
  TextEditingController namecontroller= new TextEditingController();
  TextEditingController mailcontroller= new TextEditingController();
  TextEditingController passwordcontroller= new TextEditingController();

  registration()async{
    if(password!=null && name!=null && email !=null){
      try{
        UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.redAccent , content: Text("Registered Successfully")));
        Navigator.push(context, MaterialPageRoute(builder: (context)=> login()));
      } on FirebaseException catch(e){
        if (e.code=="weak-password"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password is too weak")));
        }
        else if (e.code=="email-already-in-use"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account already exist")));
        }
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20,right: 20,top: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assests/sign-up-8694031-6983270.png"),
                SizedBox(height: 10,),
                Center(child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
                SizedBox(height: 5,),
                Center(child: Text("Please Enter Your Details Below to\n                       Continue",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black45),)),
                SizedBox(height: 10,),
                Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 5,),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: namecontroller,
                    decoration: InputDecoration(hintText: "Enter Your Name",hintStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black45),prefixIcon: Icon(Icons.perm_identity),border: InputBorder.none)
                  ),
                ),
                SizedBox(height: 10,),
                Text("Email",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 5,),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: mailcontroller,
                      decoration: InputDecoration(hintText: "Enter Your Email",hintStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black45),prefixIcon: Icon(Icons.mail),border: InputBorder.none)
                  ),
                ),
                SizedBox(height: 10,),
                Text("Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 5,),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    obscureText: true,
                      controller: passwordcontroller,
                      decoration: InputDecoration(hintText: "Enter Your Password",hintStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black45),prefixIcon: Icon(Icons.password),border: InputBorder.none)
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      name = namecontroller.text;
                      email= mailcontroller.text;
                      password=passwordcontroller.text;
                    });
                    registration();
                  },
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Colors.indigo[600],borderRadius: BorderRadius.circular(20),),
                      width: MediaQuery.of(context).size.width/2,
                      child: Center(child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),)) ,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Text("Already have account",style: TextStyle(fontSize: 22,color: Colors.black45,fontWeight: FontWeight.bold),)),
                      SizedBox(width:   5,),
                      TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                        },
                          child: Text("Sign In",style: TextStyle(fontSize: 22,color: Colors.indigo,),))
                    ],
                  ),
                SizedBox(height: 30,),
              ],
            ),
        ),
      ),
    );
  }
}
