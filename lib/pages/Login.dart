import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mycart/pages/SignUp.dart';
import 'package:mycart/pages/vegetable.dart';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String mail="",password="";
  TextEditingController mailcontroller= new TextEditingController();
  TextEditingController passwordcontroller= new TextEditingController();

  userLogin()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: mail, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> vegetable()));
    }on FirebaseAuthException catch(e){
      if (e.code=="user-not-found"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.redAccent , content: Text("Account doesn't exist")));
      }
      else if(e.code=="wrong-password"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.redAccent , content: Text("Incorrect Password")));
      }
    }
  }
  GoogleLogin()async{
      final  googleuser =  await GoogleSignIn().signIn();
      final googleauth = await googleuser?.authentication;
      final cred = GoogleAuthProvider.credential(idToken: googleauth?.idToken,accessToken: googleauth?.accessToken );
      await FirebaseAuth.instance.signInWithCredential(cred);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> vegetable()));
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
              Image.asset("assests/3094352.jpg"),
              SizedBox(height: 10,),
              Center(child: Text("Sign In",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
              SizedBox(height: 5,),
              Center(child: Text("Please Enter Credentials Below to\n                       Continue",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black45),)),
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
                  controller: passwordcontroller,
                  obscureText: true,
                    decoration: InputDecoration(hintText: "Enter Your Password",hintStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black45),prefixIcon: Icon(Icons.password),border: InputBorder.none)
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    mail=mailcontroller.text;
                    password=passwordcontroller.text;
                  });
                  userLogin();
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(color: Colors.teal[400],borderRadius: BorderRadius.circular(20),),
                    width: MediaQuery.of(context).size.width/2,
                    child: Center(child: Text("Sign In",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),)) ,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("Don't have account",style: TextStyle(fontSize: 22,color: Colors.black45,fontWeight: FontWeight.bold),)),
                  SizedBox(width:   3,),
                  TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                      },
                      child: Text("Sign Up",style: TextStyle(fontSize: 22,color: Colors.teal[400],),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("Sign In with   ",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)),
                  GestureDetector(
                      onTap: (){
                        GoogleLogin();
                      },
                      child: SizedBox(height: 40,width: 40,child: Image.asset("assests/eeccca0750dc564ea55c897f90f4fb99.png")))
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
