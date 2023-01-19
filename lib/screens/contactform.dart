
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/screens/login.dart';
import 'package:e_commerce_app/widgets/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'homepage.dart';


class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}
final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool obserText=true;
String email="";
String objet="";
String message="";


class _ContactFormState extends State<ContactForm> {

  TextEditingController _objet=new TextEditingController();
  TextEditingController _email=new TextEditingController();
  TextEditingController _message=new TextEditingController();

  Future<void> addmessage() {
    CollectionReference message = FirebaseFirestore.instance.collection('message');
    return message.add({
      'email':_email.text,
      'objet':_objet.text,
      'message':_message.text
    })
        .then((value) => print("Message added"))
        .catchError((onError) => print("Failed to add message: $onError"));
  }

  Widget _buildAllTextFormField(){
    return Container(
      height: 310,
      child: Column(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
        children:<Widget> [
          TextField(
            //obserText: obserText,
            decoration: InputDecoration(
              labelText: "email",
              hintText: "Please enter your email",
              icon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            onSubmitted:(value){
              if(value==""){
                print( "Please Fill Email");
              }
              else if(!regExp.hasMatch(value!)){
                print("Email Is Invalid");
              }
            },
            controller: _email,
          ),
          TextField(
            //obserText: obserText,
            decoration: InputDecoration(
              labelText: "Objet",
              hintText: "Please enter your object",
              //icon: Icon(Icons.people),
            ),
            keyboardType: TextInputType.text,
            controller: _objet,
          ),
          TextField(
            //obserText: obserText,
            decoration: InputDecoration(
              labelText: "Message",
              hintText: "Please enter your message",
              icon: Icon(Icons.message),
            ),
            keyboardType: TextInputType.text,
            controller: _message,
          ),
        ],
      ),
    );

  }
  Widget _buildBottonPart(){
    return Container(
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
        children: <Widget>[
          _buildAllTextFormField(),
          MyButton(
            name: "Send",
            onPressed: addmessage,
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed:() {
                Navigator.of(context).
                pushReplacement(MaterialPageRoute(
                    builder: (ctx)=>HomePage()
                ),
                );
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                  Icons.search,
                  color: Colors.black
              ),
              onPressed: (){

              },
            ),
            IconButton(
              icon: Icon(
                  Icons.notifications_none,
                  color: Colors.black
              ),
              onPressed: () {

              },
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child:
          Form(
            child: Container(
              child: Column(
                children:<Widget>[
                  Container(
                    height: 220,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Contact Us",
                          style:TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildBottonPart(),
                ],
              ),
            ),
          ),

        )
    );
  }
}