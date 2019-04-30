import 'package:flutter/material.dart';
import './model/bloc.dart';
import './model/data.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreen extends StatefulWidget {
  final Observable<String> st;

  HomeScreen({this.st});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Bloc _bloc = Bloc();

  List<String> datalist = Data().api;

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: widget.st,
          builder: (context, snap) {
            if (snap.hasData) {
              return validasi(snap.data);
            } else {
              print(snap.data);
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget validasi(String data) {
    return ListView.builder(
      itemCount: datalist.length,
      itemBuilder: (context, i) {
        if (data == datalist[i]) {
          return ListTile(
            leading: Text(datalist[i][0]),
            title: Text(datalist[i]),
          );
        } else {
          return Text('');
        }
      },
    );
  }
}
