import 'package:flutter/material.dart';

class LoadingPlaceholder extends StatefulWidget {

  LoadingPlaceholder({Key key}) : super(key: key);

  @override
  _LoadingPlaceholderState createState() => _LoadingPlaceholderState();
}

class _LoadingPlaceholderState extends State<LoadingPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
