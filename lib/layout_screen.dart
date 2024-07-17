import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  

String equation="0";
String result="0";
String exp="";

  @override
Widget build(BuildContext context) {

  buttonClicked(String num)
{
  setState(() {
  if(num=="C")
  {
    equation="0";
    result="0";
  }
  else if(num=="⌫")
  {
    equation=equation.substring(0,equation.length-1);
    if(equation.isEmpty)
    {
      equation="0";
    }
  }
  else if(num=="=")
  {
    exp=equation;
    exp=exp.replaceAll("×", "*");
    exp=exp.replaceAll("÷", "/");
    try 
    {
      Parser parser=Parser();
      Expression expression=parser.parse(exp);
      ContextModel contextModel =ContextModel();
      result="${expression.evaluate(EvaluationType.REAL,contextModel)}";
    } 
    catch (e) 
    {
    // result=e.toString();
     result= "Math Error";
    }
  }
  else
  {
    if(equation=="0")
    {
      equation=num;
    }
    else
    {
    equation=equation+num;
    }
  }
  });

}

Widget buildButton({required String num,required double width,Color btnColor=Colors.white38,Color txtColor =Colors.white})=>              
InkWell(
  onTap: () 
  {
    buttonClicked(num);
  },
  child:   Container(
  
    alignment: Alignment.center,
  
     height: 80.0,
  
     width: width,
  
     decoration: BoxDecoration(
  
     color:btnColor,
  
    borderRadius: BorderRadius.circular(80.0),
  
    ),
  
    child:  Text(num,style:  TextStyle(color: txtColor,fontSize: 30.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
  
    ),
);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
      backgroundColor: Colors.black,
      elevation: 0.0,
      title: const Text("Calculator App"),
      centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding:const EdgeInsetsDirectional.symmetric(horizontal: 10.0) ,
            height: 90.0,
            width: double.infinity,
            color: Colors.black,
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(child: Text(equation,style: const TextStyle(color: Colors.orangeAccent,fontSize: 38.0,fontWeight: FontWeight.bold),)),
          ),
          const SizedBox(height: 20.0,),
          Container(
            padding:const EdgeInsetsDirectional.symmetric(horizontal: 10.0) ,
            height: 90.0,
            width: double.infinity,
            color: Colors.black,
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(child: Text(result,style: const TextStyle(color: Colors.white,fontSize: 45.0,fontWeight: FontWeight.bold),)),
          ),
          const SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        buildButton(num: "C",width: 80.0,btnColor: Colors.grey[350]!,txtColor: Colors.black),
                        buildButton(num: "⌫",width: 80.0,btnColor: Colors.grey[350]!,txtColor: Colors.black),
                        buildButton(num: "%",width: 80.0,btnColor: Colors.grey[350]!,txtColor: Colors.black),
                        buildButton(num: "÷",width: 80.0,btnColor: Colors.orangeAccent),
                  ],
                ),
                const SizedBox(height:20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        buildButton(num: "7",width: 80.0),
                        buildButton(num: "8",width: 80.0),
                        buildButton(num: "9",width: 80.0),
                        buildButton(num: "×",width: 80.0,btnColor: Colors.orangeAccent),
                  ],
                ),
                const SizedBox(height:20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        buildButton(num: "4",width: 80.0),
                        buildButton(num: "5",width: 80.0),
                        buildButton(num: "6",width: 80.0),
                        buildButton(num: "-",width: 80.0,btnColor: Colors.orangeAccent),
                  ],
                ),
                const SizedBox(height:20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        buildButton(num: "1",width: 80.0),
                        buildButton(num: "2",width: 80.0),
                        buildButton(num: "3",width: 80.0),
                        buildButton(num: "+",width: 80.0,btnColor: Colors.orangeAccent),
                  ],
                ),
                const SizedBox(height:20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        buildButton(num: "0",width: 170.0),
                        buildButton(num: ".",width: 80.0),
                        buildButton(num: "=",width: 80.0,btnColor: Colors.orangeAccent),
                  ],
                ),
                const SizedBox(height:20.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}