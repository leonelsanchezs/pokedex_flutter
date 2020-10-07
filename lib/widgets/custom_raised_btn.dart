import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Color backColor;
  final String title;
  final Function callback;

  const CustomRaisedButton(
      {Key key,
      @required this.backColor,
      @required this.title,
      @required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2,
      highlightElevation: 5,
      color: this.backColor,
      shape: StadiumBorder(),
      child: Container(
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            this.title,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ),
      onPressed: this.callback,
    );
  }
}
