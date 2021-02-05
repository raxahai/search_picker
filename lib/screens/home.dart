import 'package:flutter/material.dart';
import '../widgets/CustomDialog.dart';

class PickerData {
  String image;
  String title;
  String subTitle;
  PickerData({this.image, this.title, this.subTitle});
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PickerData> userData = [
    PickerData(
        image: "assets/images/canada-flag.png",
        title: 'Canadian dollar',
        subTitle: 'CAD'),
    PickerData(
        image: "assets/images/united-kingdom-flag.png",
        title: 'Great british pound',
        subTitle: 'GBP'),
    PickerData(
        image: "assets/images/america-flag-png.png",
        title: 'US dollar',
        subTitle: 'USD'),
    // PickerData(title: 'Umair Rabbani', subTitle: 'PKR'),
    // PickerData(title: 'Obaid Saleem', subTitle: 'IND'),
    // PickerData(title: 'Junaid Khan', subTitle: 'SAR'),
    // PickerData(title: 'Muhammad Hassan', subTitle: 'GDP'),
  ];
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
                        dialogTitle: "Select account",
                        dialogSearch: true,
                        list: userData,
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
