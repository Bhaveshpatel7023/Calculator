import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


     late int firstnum;
     late int secondnum;
     String texttodisplay="";
     late String res;
     late String operatortoperform;
     void btnclicked(String bvalue){
      if(bvalue =="C"){
        texttodisplay ="";
        firstnum = 0;
        secondnum = 0;
        res ="";
      }
      else if(bvalue=="+"||bvalue=="-"||bvalue=="x"||bvalue=="/"){
        firstnum = int.parse(texttodisplay);
        res ="";
        operatortoperform = bvalue;

      }
      else if(bvalue=="="){
        secondnum = int.parse(texttodisplay);
        if(operatortoperform == "+"){
          res =(firstnum + secondnum).toString();
        }
        if(operatortoperform == "-"){
          res =(firstnum - secondnum).toString();
        }
        if(operatortoperform == "x"){
          res =(firstnum * secondnum).toString();
        }
        if(operatortoperform == "/"){
          res =(firstnum / secondnum).toString();
        }
      }
        else{
          res = int.parse(texttodisplay + bvalue).toString();
        }
      setState(() {
        texttodisplay = res;
      });

      
     }



      Widget custombutton(String bvalue){
        return Expanded(
          
          child: Padding(
            padding:EdgeInsets.all(2),
            child: OutlinedButton(
              
                   
              child:Padding(
                padding:EdgeInsets.all(10),
                child: Text('$bvalue',style: TextStyle(fontSize: 25),
                selectionColor: Colors.black26,
                )
                
                ),
              onPressed: ()=> btnclicked(bvalue),
              ),
          )
        );
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Calculator')
      ),

   body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                "$texttodisplay",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ) 
            ),
         
          Row(
          children: <Widget>[
            custombutton('7'),
            custombutton('8'),
            custombutton('9'),
            custombutton('x'),
          ],
          ), 
          Row(
          children: <Widget>[
            custombutton('4'),
            custombutton('5'),
            custombutton('6'),
            custombutton('-'),
          ],
          ), 
          Row(
          children: <Widget>[
            custombutton('1'),
            custombutton('2'),
            custombutton('3'),
            custombutton('+'),
          ],
          ),
          Row(
          children: <Widget>[
            custombutton('C'),
            custombutton('0'),
            custombutton('/'),
            custombutton('='),
          ],
          ),  
        ],
      )
   )

    );
  }
}



