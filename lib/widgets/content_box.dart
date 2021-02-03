import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class PickerData {
  String title;
  String subTitle;
  PickerData({this.title, this.subTitle});
}

class ContentBox extends StatefulWidget {
  final String title;
  final bool isSearch;
  ContentBox({this.title, this.isSearch = false});
  @override
  _ContentBoxState createState() => _ContentBoxState();
}

class _ContentBoxState extends State<ContentBox> {
  GlobalKey<AutoCompleteTextFieldState<PickerData>> key = new GlobalKey();
  TextEditingController controller = new TextEditingController();
  AutoCompleteTextField searchTextField;

  // list of consumers
  List<PickerData> lst = [
    PickerData(title: 'Syed Raza Haider', subTitle: 'USD'),
    PickerData(title: 'Abdul Mateen', subTitle: 'GDP'),
    PickerData(title: 'Abdul samad', subTitle: 'GDP'),
    PickerData(title: 'Umair Rabbani', subTitle: 'PKR'),
    PickerData(title: 'Obaid Saleem', subTitle: 'IND'),
    PickerData(title: 'Junaid Khan', subTitle: 'SAR'),
    PickerData(title: 'Muhammad Hassan', subTitle: 'GDP'),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 55, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 35),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    new Container(
                      // color: Colors.red,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: new Icon(
                              Icons.search,
                            ),
                          ),
                          Expanded(
                            child: searchTextField =
                                AutoCompleteTextField<PickerData>(
                              key: key,
                              style: new TextStyle(
                                color: Colors.black,
                              ),
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                              itemBuilder: (context, item) {
                                return Container(
                                  width: 500,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: ListTile(
                                    title: Text(item.title),
                                    subtitle: Text(item.subTitle),
                                    dense: true,
                                  ),
                                );
                                // return showListTile(item);
                              },
                              itemFilter: (item, query) {
                                return item.title
                                    .toLowerCase()
                                    .startsWith(query.toLowerCase());
                              },
                              suggestions: lst,
                              itemSubmitted: (item) {
                                print(item.title);
                              },
                              itemSorter: (a, b) {
                                return a.title.compareTo(b.title);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: lst.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5.0)),
                            margin: EdgeInsets.only(bottom: 10),
                            child: ListTile(
                                title: Text(
                                  lst[index].title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(lst[index].subTitle),
                                dense: true,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black12, width: 2.0))),
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Container(
                  height: 200,
                ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            // backgroundColor: Colors.transparent,
            radius: 35,
            // child: ClipRRect(),
          ),
        )
      ],
    );
  }
}
