import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  final String dialogTitle;
  final bool dialogSearch;
  final List list;
  MyDialog({this.dialogTitle, this.dialogSearch = false, this.list});
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
          list: list,
        ));
  }
}

class ContentBox extends StatefulWidget {
  final String title;
  final bool isSearch;
  final List list;
  ContentBox({this.title, this.isSearch = false, this.list});
  @override
  _ContentBoxState createState() => _ContentBoxState();
}

class _ContentBoxState extends State<ContentBox> {
  List filteredList = new List();
  @override
  void initState() {
    super.initState();
    filteredList = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget.isSearch
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  // color: Colors.red,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: new Icon(
                          Icons.search,
                        ),
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none),
                        onChanged: (string) {
                          setState(() {
                            filteredList = widget.list
                                .where((u) => u.title
                                    .toLowerCase()
                                    .contains(string.toLowerCase()))
                                .toList();
                          });
                        },
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 1.5,
                  color: Colors.black.withOpacity(0.2),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5.0)),
                          margin: EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: -2.5),
                            title: Text(
                              filteredList[index].title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(filteredList[index].subTitle),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),
                            dense: true,
                          ));
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red[300],
                      ),
                    ),
                  ],
                )
              ],
            )
          : Container(
              height: 200,
            ),
    );
  }
}
