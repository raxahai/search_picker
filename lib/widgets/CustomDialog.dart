import 'package:flutter/material.dart';
import 'content_box.dart';

class PickerData {
  String title;
  String subTitle;
  PickerData({this.title, this.subTitle});
}

class MyDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: ContentBox(
          title: "Select beneficiary",
        ));
  }
}
