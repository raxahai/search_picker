import 'package:flutter/material.dart';
import 'package:search_picker/screens/home.dart';
import 'content_box.dart';

class MyDialog extends StatelessWidget {
  final String dialogTitle;
  final bool dialogSearch;
  final TabData tab1;
  final TabData tab2;
  MyDialog({this.dialogTitle, this.dialogSearch = false, this.tab1, this.tab2});
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: ContentBox(
          isSearch: dialogSearch,
          tab1: tab1,
          tab2: tab2,
        ));
  }
}
