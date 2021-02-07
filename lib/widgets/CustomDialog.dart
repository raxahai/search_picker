import 'package:flutter/material.dart';
import 'content_box.dart';

class MyDialog extends StatelessWidget {
  final String dialogTitle;
  final bool dialogSearch;
  final List list1;
  final List list2;
  MyDialog(
      {this.dialogTitle, this.dialogSearch = false, this.list1, this.list2});
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: ContentBox(
          title: dialogTitle,
          isSearch: dialogSearch,
          list1: list1,
          list2: list2,
        ));
  }
}
