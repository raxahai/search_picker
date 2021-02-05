import 'package:flutter/material.dart';

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
      // padding: EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget.isSearch
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: FlatButton(
                          child: Text("Account"),
                          onPressed: () {},
                          color: Colors.red[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: FlatButton(
                          child: Text("Beneficiary"),
                          onPressed: () {},
                          color: Colors.red[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
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
                  height: 10,
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
