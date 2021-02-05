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

  Color themeColor = Colors.red[300];

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          color: themeColor,
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
                          color: themeColor,
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
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: new Icon(
                          Icons.search,
                          color: Colors.black38,
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
                  margin: EdgeInsets.symmetric(horizontal: 15),
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
                          padding: EdgeInsets.only(right: 5, top: 8, bottom: 8),
                          margin:
                              EdgeInsets.only(bottom: 10, left: 15, right: 15),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  filteredList[index].image,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      filteredList[index].title,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      filteredList[index].subTitle,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                                color: Colors.black38,
                              ),
                            ],
                          ));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
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
                          color: themeColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            )
          : Container(
              height: 200,
            ),
    );
  }
}
