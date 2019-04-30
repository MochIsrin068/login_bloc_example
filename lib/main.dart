import 'package:flutter/material.dart';
import './model/data.dart';
import './model/bloc.dart';

void main() {
  runApp(MaterialApp(
    title: "Test",
    home: ListData(),
  ));
}

class ListData extends StatefulWidget {
  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  TextEditingController _myText = TextEditingController();

  List<String> dataApi = Data().api;

  Bloc _bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Api Bloc")),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _myText,
                  decoration: InputDecoration(hintText: "Search"),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _bloc.search(_myText.text, context);
                  _myText.clear();
                },
                child: Text("Search"),
              )
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: dataApi.length,
            itemBuilder: (context, i) {
              return ListTile(
                leading: Text(dataApi[i][0]),
                title: Text(dataApi[i]),
              );
            },
          )
        ],
      ),
    );
  }
}
