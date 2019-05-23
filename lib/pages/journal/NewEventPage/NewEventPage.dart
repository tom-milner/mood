import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:mood_app/pages/journal/NewEventPage/ZefyrEditor.dart';
import 'package:mood_app/widgets/MoodCard.dart';
import "package:flutter_fluid_slider/flutter_fluid_slider.dart";
import "package:mood_app/models/Event.dart";
import "package:mood_app/blocs/EventBloc.dart";

class NewEventPage extends StatefulWidget {
  _NewEventPageState createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  final eventBloc = EventBloc();

  // must be state variable so it can set state
  var ratingInput;
  double sliderValue = 3;
  String eventTitle;
  String eventNotes;

  bool isComplete = false;

  createNewEvent() async {
    if (eventTitle == "" || eventNotes == "" || !isComplete) {
      return;
    } else {
      int eventTime = DateTime.now().millisecondsSinceEpoch;
      int eventRating = sliderValue.floor();
      Event newEvent = Event(
          title: eventTitle,
          rating: eventRating,
          millisFromEpoch: eventTime,
          notes: eventNotes);

      await eventBloc.createNewEvent(newEvent);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _titleInput = MoodCard(
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

    final _notesInput = MoodCard(
      child: Container(
        height: 350,
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: TextField(
          autocorrect: true,
          onChanged: (notes) {
            eventNotes = notes;
            isComplete = true;
          },
          keyboardType: TextInputType.multiline,
          maxLines: 10,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Notes",
          ),
        ),
      ),
    );

    // rating slider
    ratingInput = Container(
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

    final _submitButton = RaisedButton(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      onPressed: () async {
        if (isComplete) await createNewEvent();
        return null;
      },
//    onPressed: (){print("hgello");},

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

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).canvasColor,
      appBar: new AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.description),
            color: Theme.of(context).primaryColor,
            onPressed: (){
              print("navigating to zefyr");
              return Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context){
                    return ZefyrEditor();
                  })
              );
            },
          )
        ],
        title: Text("Add New Entry"),
        textTheme: Theme.of(context).textTheme,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          _titleInput,
          _notesInput,
          ratingInput,
          _submitButton
        ],
      ),
    );
  }
}
