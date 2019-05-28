import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:mood_app/models/Event/Tag.dart';
import 'package:mood_app/pages/journal/NewEventPage/ZefyrEditorPage.dart';
import 'package:mood_app/utils/Utils.dart';
import 'package:mood_app/widgets/CustomImageDelegate.dart';
import 'package:mood_app/widgets/MoodCard.dart';
import "package:flutter_fluid_slider/flutter_fluid_slider.dart";
import "package:mood_app/models/Event/Event.dart";
import "package:mood_app/blocs/EventBloc.dart";
import 'package:mood_app/widgets/MoodSnackBar.dart';
import 'package:zefyr/zefyr.dart';

class NewEventPage extends StatefulWidget {
  _NewEventPageState createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  final eventBloc = EventBloc();

  // create a new Document
  final ZefyrController _controller = ZefyrController(NotusDocument());
  final FocusNode _focusNode = new FocusNode();

  // for alerting users
  MoodSnackBar snackBar = new MoodSnackBar();
  TextEditingController _textEditingController = new TextEditingController();

  String _tagsInputValue;
  bool _tagInputIsEmpty = true;

  // must be state variable so it can set state
  double sliderValue = 3;
  String eventTitle;
  List<Tag> tags = <Tag>[];

  void dispose() {
    _textEditingController.dispose();
  }

  createNewEvent() async {
    if (eventTitle != null && eventTitle != "" && eventTitle.isNotEmpty) {
      int eventTime = DateTime.now().millisecondsSinceEpoch;
      int eventRating = sliderValue.floor();
      Event newEvent = Event(
        title: eventTitle,
        rating: eventRating,
        millisFromEpoch: eventTime,
      );
      newEvent.setNotesDeltaString(_controller.document.toDelta());
      await eventBloc.createNewEvent(newEvent);

      Navigator.of(context).pop();
    }
  }

  Widget _buildTitleInput(
    context,
  ) {
    return MoodCard(
      child: Container(
        height: 70,
        alignment: Alignment.center,
        child: TextField(
          autocorrect: true,
          inputFormatters: [
            LengthLimitingTextInputFormatter(20),
          ],
          onChanged: (title) => (eventTitle = title),
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: Theme.of(context).primaryColor),
          decoration: InputDecoration(
            hintText: "Event Title",
            prefixIcon: Icon(
              Icons.title,
              color: Theme.of(context).primaryColor,
            ),
            border: InputBorder.none,
            focusedBorder: null,
            enabledBorder: null,
//                    contentPadding: EdgeInsets.symmetric(vertical: 5)),
          ),
        ),
      ),
    );
  }

  ZefyrThemeData _buildZefyrTheme(context) {
    return ZefyrThemeData(
      toolbarTheme: ZefyrToolbarTheme.fallback(context).copyWith(
        color: Utils.lightenColor(Theme.of(context).primaryColor),
        toggleColor: Utils.darkenColor(Theme.of(context).primaryColor),
      ),
      cursorColor: Theme.of(context).primaryColor,
    );
  }

  Widget _buildNotesInput(context) {
    var _zefyrTheme = _buildZefyrTheme(context);

    return MoodCard(
      child: Container(
//        padding: EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ZefyrTheme(
                data: _zefyrTheme,
                child: ZefyrField(
                  height: 300.0,
                  decoration: InputDecoration(
                    labelText: 'Notes',
                    border: InputBorder.none,
                    focusedBorder: null,
                    enabledBorder: null,
                  ),
                  controller: _controller,
                  focusNode: _focusNode,
                  autofocus: true,
                  imageDelegate: new CustomImageDelegate(),
                  physics: ClampingScrollPhysics(),
                ),
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.fullscreen),
                  iconSize: 25,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    return Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ZefyrEditorPage(_zefyrTheme, _controller.document);
                    }));
                  },
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildTagBox(context, Tag tag) {
    return GestureDetector(
      onTap: (){
        setState(() {
          tags.remove(tag);
        });
      },

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Theme.of(context).primaryColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
        margin: EdgeInsets.only(right: 5),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              tag.title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Theme.of(context).buttonColor),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.clear,
              size: 15,
              color: Theme.of(context).buttonColor,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTagsContainer(
    context,
  ) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: tags.length,
        itemBuilder: (BuildContext context, int index) {
          if (tags.length == 0) return Container();
          return _buildTagBox(context, tags[index]);
        },
      ),
    );
  }

  Widget _buildTagsInput(context) {
    return MoodCard(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textEditingController,
              onChanged: (value) {
                _tagsInputValue = value;
                setState(() {
                  _tagsInputValue.length > 0
                      ? _tagInputIsEmpty = false
                      : _tagInputIsEmpty = true;
                });
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
              ],
              decoration: InputDecoration(
                hintText: "Tags",
                prefixIcon: Icon(
                  Icons.outlined_flag,
                  color: Theme.of(context).primaryColor,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          Builder(builder: (BuildContext context) {
            return Container(
                width: 50,
                alignment: Alignment.center,
                child: IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: Icon(Icons.add),
                  onPressed: _tagInputIsEmpty
                      ? null
                      : () {
                          // make sure there is input
                          // check if tag already exists in tags list
                          bool alreadyExists = false;
                          for (Tag tag in tags) {
                            if (_tagsInputValue == tag.title) {
                              alreadyExists = true;
                              snackBar.showSnackBar(
                                  context, "Tag already added.");
                            }
                          }
                          if (!alreadyExists) {
                            setState(() {
                              tags.add(Tag(title: _tagsInputValue));
                              _textEditingController.clear();
                            });
                          }
                        },
                ));
          }),
        ],
      ),
    );
  }

  Widget _buildRatingInput(context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      width: 500,
      child: FluidSlider(
        value: sliderValue,
        onChanged: (newValue) {
          setState(() {
            sliderValue = newValue;
          });
        },
        min: 1,
        max: 5.8,
        valueTextStyle: Theme.of(context)
            .textTheme
            .title
            .copyWith(color: Theme.of(context).primaryColor),
        start: Icon(
          Icons.sentiment_dissatisfied,
          size: 30,
          color: Theme.of(context).canvasColor,
        ),
        end: Icon(
          Icons.sentiment_satisfied,
          size: 30,
          color: Theme.of(context).canvasColor,
        ),
      ),
//      ),
    );
  }

  Widget _buildSubmitButton(context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      onPressed: () async {
        await createNewEvent();
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Container(
          alignment: Alignment.center,
          height: 30,
          width: 150,
          child: Text(
            "Submit",
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: Theme.of(context).buttonColor),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Theme.of(context).canvasColor,
      appBar: new AppBar(
        title: Text("Add New Entry"),
        textTheme: Theme.of(context).textTheme,
        elevation: 0,
      ),
      body: ZefyrScaffold(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            _buildTitleInput(context),
            _buildNotesInput(context),
            tags.length > 0 ? _buildTagsContainer(context) : Container(),
            _buildTagsInput(context),
            _buildRatingInput(context),
            _buildSubmitButton(context)
          ],
        ),
      ),
    );
  }
}
