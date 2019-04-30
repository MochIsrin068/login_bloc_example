import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import '../homeScreen.dart';

class Bloc {
  BehaviorSubject<String> _subject = BehaviorSubject<String>();

  StreamSink<String> get evenData => _subject.sink;

  Observable<String> get streamData => _subject.stream;

  void search(String newEvent, BuildContext context) {
    evenData.add(newEvent);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeScreen(
              st: streamData,
            )));
  }

  void dispose() {
    _subject.close();
  }
}
