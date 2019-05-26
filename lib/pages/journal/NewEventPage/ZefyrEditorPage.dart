import "package:flutter/material.dart";
import "package:zefyr/zefyr.dart";

class ZefyrEditorPage extends StatefulWidget {
  ZefyrThemeData zefyrThemeData;
  NotusDocument document;

  ZefyrEditorPage(this.zefyrThemeData, this.document);

  @override
  _zefyrEditorPageState createState() => _zefyrEditorPageState();
}

class _zefyrEditorPageState extends State<ZefyrEditorPage> {
  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // load in existing document
    _controller = new ZefyrController(widget.document);
    _focusNode = new FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).buttonColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Entry Editor",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: ZefyrScaffold(
        child: ZefyrTheme(
          data: widget.zefyrThemeData,
          child: ZefyrEditor(
            controller: _controller,
            focusNode: _focusNode,
          ),
        ),
      ),
    );
  }
}
