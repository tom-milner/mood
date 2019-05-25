import "package:flutter/material.dart";
import "package:zefyr/zefyr.dart";

class ZefyrEditorPage extends StatefulWidget {
  @override
  _zefyrEditorPageState createState() => _zefyrEditorPageState();
}

class _zefyrEditorPageState extends State<ZefyrEditorPage> {
  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
//     Create an empty document or load existing if you have one.
//     Here we create an empty document:
    final document = new NotusDocument();
    _controller = new ZefyrController(document);
    _focusNode = new FocusNode();
  }

  @override
  Widget build(BuildContext context) {

   final zefyrTheme = ZefyrThemeData(
     cursorColor: Theme.of(context).primaryColor,
     toolbarTheme: ZefyrToolbarTheme.fallback(context).copyWith(

     ),
   );


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Entry Editor",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: ZefyrScaffold(
        child: ZefyrTheme(
          data: zefyrTheme,
          child: ZefyrEditor(
            controller: _controller,
            focusNode: _focusNode,
          ),
        ),
          ),
    );
  }
}
