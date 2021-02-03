import 'package:flutter/material.dart';
import 'content_box.dart';

class MyDialog extends StatelessWidget {
  final String dialogTitle;
  final bool dialogSearch;
  MyDialog({this.dialogTitle, this.dialogSearch = false});
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
        ));
  }
}
