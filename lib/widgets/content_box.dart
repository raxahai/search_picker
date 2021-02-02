import 'package:flutter/material.dart';

class ContentBox extends StatefulWidget {
  final String title;
  final bool isSearch;
  ContentBox({this.title, this.isSearch = false});
  @override
  _ContentBoxState createState() => _ContentBoxState();
}

class _ContentBoxState extends State<ContentBox> {
  TextEditingController controller = new TextEditingController();

  void onSearchTextChanged(String text) async {
    if (text.isEmpty) {
      setState(() {});
      return;
    }
  }

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
                            child: new TextField(
                              controller: controller,
                              decoration: new InputDecoration(
                                  hintText: 'Search',
                                  // border: OutlineInputBorder(
                                  //   borderSide:
                                  //       new BorderSide(color: Colors.teal),
                                  // ),
                                  border: InputBorder.none),
                              onChanged: onSearchTextChanged,
                            ),
                          ),
                        ],
                      ),
                      // color: Theme.of(context).primaryColor,
                      // child: new Card(
                      //   child: new ListTile(
                      //     tileColor: Colors.red,
                      //     leading: new Icon(
                      //       Icons.search,
                      //     ),
                      //     title: new TextField(
                      //       controller: controller,
                      //       decoration: new InputDecoration(
                      //           hintText: 'Search', border: InputBorder.none),
                      //       onChanged: onSearchTextChanged,
                      //     ),
                      //     // trailing: new IconButton(
                      //     //   icon: new Icon(Icons.cancel),
                      //     //   onPressed: () {
                      //     //     controller.clear();
                      //     //     onSearchTextChanged('');
                      //     //   },
                      //     // ),
                      //   ),
                      // ),
                    ),
                    // new Expanded(
                    //   child: _searchResult.length != 0 || controller.text.isNotEmpty
                    //       ? new ListView.builder(
                    //     itemCount: _searchResult.length,
                    //     itemBuilder: (context, i) {
                    //       return new Card(
                    //         child: new ListTile(
                    //           leading: new CircleAvatar(backgroundImage: new NetworkImage(_searchResult[i].profileUrl,),),
                    //           title: new Text(_searchResult[i].firstName + ' ' + _searchResult[i].lastName),
                    //         ),
                    //         margin: const EdgeInsets.all(0.0),
                    //       );
                    //     },
                    //   )
                    //       : new ListView.builder(
                    //     itemCount: _userDetails.length,
                    //     itemBuilder: (context, index) {
                    //       return new Card(
                    //         child: new ListTile(
                    //           leading: new CircleAvatar(backgroundImage: new NetworkImage(_userDetails[index].profileUrl,),),
                    //           title: new Text(_userDetails[index].firstName + ' ' + _userDetails[index].lastName),
                    //         ),
                    //         margin: const EdgeInsets.all(0.0),
                    //       );
                    //     },
                    //   ),
                    // ),
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
