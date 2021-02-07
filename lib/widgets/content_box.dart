import 'package:flutter/material.dart';

class ContentBox extends StatefulWidget {
  String title;
  final bool isSearch;
  final List list1;
  final List list2;
  ContentBox({this.title, this.isSearch = false, this.list1, this.list2});
  @override
  _ContentBoxState createState() => _ContentBoxState();
}

class _ContentBoxState extends State<ContentBox> {
  var isAccount = true;
  List filteredListAccount = new List();
  List filteredListBeneficiary = new List();
  @override
  void initState() {
    super.initState();
    filteredListAccount = widget.list1;
    filteredListBeneficiary = widget.list2;
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
          ? (isAccount ? showAccount() : showBeneficiary())
          : Container(
              height: 200,
            ),
    );
  }

  Widget showAccount() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                color: themeColor,
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
              child: Container(
                height: 50,
                color: themeColor,
                child: FlatButton(
                  child: Text("Beneficiary"),
                  onPressed: () {
                    setState(() {
                      isAccount = false;
                      widget.title = "Select Beneficiary";
                    });
                  },
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
                    filteredListAccount = widget.list1
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
            itemCount: filteredListAccount.length,
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0)),
                  padding: EdgeInsets.only(right: 5, top: 8, bottom: 8),
                  margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          filteredListAccount[index].image,
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
                              filteredListAccount[index].title,
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              filteredListAccount[index].subTitle,
                              style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }

  Widget showBeneficiary() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: FlatButton(
                  child: Text("Account"),
                  onPressed: () {
                    setState(() {
                      isAccount = true;
                      widget.title = "Select account";
                    });
                  },
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
                    filteredListBeneficiary = widget.list2
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
            itemCount: filteredListBeneficiary.length,
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0)),
                  padding: EdgeInsets.only(right: 5, top: 8, bottom: 8),
                  margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              filteredListBeneficiary[index].title,
                            ),
                            Text(
                              filteredListBeneficiary[index].subTitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
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
    );
  }
}
