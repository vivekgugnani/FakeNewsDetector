import 'package:flutter/material.dart';
import 'package:fake_news_detector/Utilities/Networking.dart';

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void _handleSubmitted(String text) {
    Networking networking = Networking();
    networking.getData(text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            border: Border.all(
              color: Colors.black,
              width: 0.4,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          width: _width * 0.7,
          height: _height * 0.5,
          child: TextField(
            maxLines: 200,
            textAlignVertical: TextAlignVertical.bottom,
            enableInteractiveSelection: true,
            controller: _controller,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration.collapsed(
                border: InputBorder.none,
                hintText: 'Enter text...',
                hintStyle: TextStyle(fontSize: _height * 0.03)),
            style: TextStyle(
              fontSize: _height * 0.03,
            ),
            scrollPhysics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          ),
        ),
        SizedBox(
          height: _height * 0.05,
        ),
        Container(
          width: _width * 0.55,
          height: _height * 0.09,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: Colors.red),
            ),
            onPressed: () => _handleSubmitted(_controller.text),
            color: Colors.pink,
            child: Text(
              'VERIFY',
              style: TextStyle(fontSize: _height * 0.03, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
