import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyState();
  }
}

final ThemeData kIOSTheme = new ThemeData(
  //Cupertino主题风格
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  //默认的Material主题风格
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

final bool iOS = defaultTargetPlatform == TargetPlatform.iOS;

class MyState extends State<DialogPage> {
  _showDialog() {
    NavigatorState navigator =
        context.rootAncestorStateOfType(const TypeMatcher<NavigatorState>());
    debugPrint("navigator is null?  " + (navigator == null).toString());

    var dialog;
    if (iOS) {
      dialog = new CupertinoAlertDialog(
        title: new Text("登录失败"),
        content: new Text("This is my content"),
        actions: <Widget>[
          new FlatButton(
            child: new Text("CANCEL"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          new FlatButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    } else {
      dialog = new AlertDialog(
        title: new Text("登录失败"),
        content: new Text("This is my content"),
        actions: <Widget>[
          new FlatButton(
            child: new Text("CANCEL"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          new FlatButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    }
    showDialog<Null>(context: context, builder: (_) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: iOS ? kIOSTheme : kDefaultTheme,
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Welcome to Flutter'),
          ),
          body: new Center(
            child: new ListTile(
                title: new Text('Hello World'),
                trailing: new Icon(Icons.send),
                onTap: () {
                  _showDialog();
                }),
          )),
    );
  }
}
