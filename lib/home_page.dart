import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  State createState()=>new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var data=TextEditingController();
        return new Scaffold(
          appBar: new AppBar(
            title:new Text("Calculator"),
          ),
          body: new Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(
                    height: Theme.of(context).textTheme.headline1.fontSize*1.1+25.0,
                  ),
                  alignment: Alignment.bottomRight,
                  color: Colors.white,
                  child: TextField(
                    controller:data,
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.black
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("C", ()=>{data.text=""}),
                _button("0", ()=>{data.text=data.text+"0"}),
                _button("=", ()=>{/*TODO:Sum*/}),
                _button("/", ()=>{data.text=data.text+"/"}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("7", ()=>{data.text=data.text+"7"}),
                _button("8", ()=>{data.text=data.text+"8"}),
                _button("9", ()=>{data.text=data.text+"9"}),
                _button("*", ()=>{data.text=data.text+"*"}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("4", ()=>{data.text=data.text+"4"}),
                _button("5", ()=>{data.text=data.text+"5"}),
                _button("6", ()=>{data.text=data.text+"6"}),
                _button("-", ()=>{data.text=data.text+"-"}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("1", ()=>{data.text=data.text+"1"}),
                _button("2", ()=>{data.text=data.text+"2"}),
                _button("3", ()=>{data.text=data.text+"3"}),
                _button("+", ()=>{data.text=data.text+"+"}),
              ],
            ),
          ],
        )
      ),
    );
  }
}



Widget _button(String number, Function() f){
  return MaterialButton(height: 80.0,
    minWidth: 80,
    child: Text(
      number,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
    ),
    textColor: Colors.black,
    color: Colors.grey[100],
    onPressed: f,
  );
}