import 'package:flutter/material.dart';

import 'config.dart';

class FilePickerWidget extends StatefulWidget {
  FilePickerWidget({Key key}) : super(key: key);

  @override
  _FilePickerWidgetState createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MAIN_COLOR,
          elevation: 15,
          title: Text("MOIA INVOICE"),
        ),
        body: Center(
          child: RaisedButton(
              color: Colors.amberAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.folder_open),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Open INVOICE directory",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              onPressed: () {}),
        ),
      ),
    );
  }
}
