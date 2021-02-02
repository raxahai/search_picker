import 'package:flutter/material.dart';
import '../widgets/CustomDialog.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Picker",
        ),
      ),
      body: Center(
        child: Container(
          // color: Colors.red,
          child: FlatButton(
            color: Colors.red,
            child: Text("Show Dialog"),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => MyDialog(
                        dialogTitle: "Select beneficiary",
                        dialogSearch: true,
                      ));
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
