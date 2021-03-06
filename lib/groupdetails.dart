import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/rendering.dart';
import 'homepage.dart';
import 'dart:convert';
import 'dart:collection';

List<PersonData> members=new List<PersonData>();
String _selectedChoice="";
int count=0;
var Json = const JsonCodec();
var groupname="";

class addGroup extends StatefulWidget {
  @override
  addGroupstate createState() => new addGroupstate();
}

class addGroupstate extends State<addGroup>{
  final GlobalKey<FormState> _groupformKey = new GlobalKey<FormState>();
  void _handleSubmitted() {
    final FormState form = _groupformKey.currentState;
    form.save();
    Navigator.of(context).pushNamed('/b');

  }
  void _select(PersonData user) {
    members.add(user);
    setState(() {
      count = count + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(count);
    List<Widget> children1= new List.generate(count, (int i) => new memberlist(members[i].name));
    for(var i=0;i<children1.length;i++) {
      print(children1[i].toString());
    }
    return new Scaffold(
      body: new Form(
        key: _groupformKey,
        child: new ListView(
          children: <Widget>[
            new Container(
              child: new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Groupname',
                  labelText: 'Name of the group',
                  isDense: true,
                ),
                onSaved: (String value) {
                  grpd.groupname=value;
                },
              ),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(100.0),border: new Border.all(
                color: Colors.black,
                width: 1.0,
                ),
              ),
              padding: new EdgeInsets.only( bottom:15.0, top:0.0,right: 20.0 ),
            ),


            new PopupMenuButton<PersonData>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return users.map((PersonData user) {
                  return new PopupMenuItem<PersonData>(
                    value: user,
                    child: new Text(user.name),
                  );
                }).toList();
              },
            ),


            new Column(
              children:children1,
            ),


            new Container(
              alignment: Alignment.center,
              child: new FloatingActionButton(
                onPressed: _handleSubmitted,
                child: new Icon(Icons.check),
              ),
            ),
          ],
        ),
      ),
    );
  }


}


class memberlist extends StatelessWidget {
  final String mem;
  memberlist(this.mem);

  @override
  Widget build(BuildContext context) {
    return new Text("${mem}");
  }
}
