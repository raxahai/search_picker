import 'package:flutter/material.dart';
import 'package:search_picker/screens/home.dart';

class ContentBox extends StatefulWidget {
  final bool isSearch;
  final TabData tab1;
  final TabData tab2;
  ContentBox({this.isSearch = false, this.tab1, this.tab2});
  @override
  _ContentBoxState createState() => _ContentBoxState();
}

class _ContentBoxState extends State<ContentBox>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Size size;

  var isAccount = true;
  List<PickerData> filteredListAccount = new List<PickerData>();
  List<PickerData> filteredListBeneficiary = new List<PickerData>();
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    filteredListAccount = widget.tab1.tabList;
    filteredListBeneficiary = widget.tab2.tabList;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Color themeColor = Colors.red[300];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.7,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget.isSearch
            ? Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                    ),
                    child: TabBar(
                      indicatorWeight: 3,
                      indicatorColor: Colors.white,
                      controller: _tabController,
                      tabs: [
                        Text("Account"),
                        Text("Beneficiary"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _showAccount(),
                        _showBeneficiary(),
                      ],
                    ),
                  )
                ],
              )
            : Container(
                height: 200,
              ),
      ),
    );
  }

  Widget _showAccount() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(
          widget.tab1.tabTitle,
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16),
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
                    filteredListAccount = widget.tab1.tabList
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
                margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.only(right: 5, top: 8, bottom: 8),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(fontSize: 12),
                                  ),
                                  Text(
                                    filteredListAccount[index].subTitle,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
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
                        )),
                  ),
                ),
              );
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
                  ),
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

  Widget _showBeneficiary() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(
          widget.tab2.tabTitle,
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16),
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
                    filteredListBeneficiary = widget.tab2.tabList
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
                margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.only(right: 5, top: 8, bottom: 8),
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    filteredListBeneficiary[index].subTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(fontSize: 12),
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
                        )),
                  ),
                ),
              );
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
                  ),
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
