import 'package:flutter/material.dart';
import './otherpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  String mainProfilePicture = "https://t4.ftcdn.net/jpg/01/77/51/49/160_F_177514906_Q5568gYE9Qa8OgZKIq71iwtErltWgRix.jpg";
  String otherProfilePicture = "https://t4.ftcdn.net/jpg/01/77/51/59/240_F_177515991_cMdbQtdW4yclI5u3BZrfcRknfCv1hWiA.jpg";
  String user = "gautam";
  String mail = "gouthammallepula@gmail.com";
  String user2 = "king";
  String mail2 = "kingofoz@gmail.com";

  void switchUser(){
    String backupString = mainProfilePicture;
    String changename = user;
    String changemail = mail;
    this.setState((){
        mainProfilePicture = otherProfilePicture;
        otherProfilePicture = backupString;
        user = user2;
        user2 = changename;
        mail = mail2;
        mail2 = changemail;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("My App Drawer"),backgroundColor: Colors.black,),drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(user),
              accountEmail: new Text(mail),
              currentAccountPicture: new GestureDetector(
                onTap: () => print('CurrentUser'),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(mainProfilePicture)
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                onTap: () => switchUser(),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(otherProfilePicture),
                ),
              )
              ],
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage("https://img00.deviantart.net/c24e/i/2015/073/c/3/dark_paper_background_by_userisamonkey-d8lqblg.png")
                )
              ),
            ),
            new ListTile(
              title: new Text("FIrst Page"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext)=> new OtherPage("first page")));
              },
            ),
            new ListTile(
              title: new Text("Second Page"),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext)=> new OtherPage("first page")));
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("cancel"),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: new Center(
        child: new Text("HomePage",style: new TextStyle(fontSize: 20.0),),
      ),
    );
  }
}