import "package:flutter/material.dart";
import 'package:mood_app/models/Event.dart';
import 'package:mood_app/utils/Utils.dart';
import 'package:mood_app/widgets/CustomImageDelegate.dart';
import 'package:mood_app/widgets/MoodCard.dart';
import 'package:mood_app/widgets/PageTitle.dart';
import 'package:quill_delta/quill_delta.dart';
import "package:zefyr/zefyr.dart";

class ViewEventPage extends StatelessWidget {
  Event event;
  Color eventColor;
  IconData eventIcon;

  ViewEventPage(this.event, this.eventColor, this.eventIcon);


  @override
  Widget build(BuildContext context) {


  Delta notesDelta = event.getDelta();

    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Journal Entry",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        body: ListView(

          padding: EdgeInsets.all(10),
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(
                event.title,
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .copyWith(fontStyle: FontStyle.italic, fontSize: 40),
              ),
            ),

            // RATING

//     ListView(
//                padding: EdgeInsets.all(10),
//                shrinkWrap: true,
//                children: <Widget>[
//                  Text(
//                    "Your Rating:",
//                    textAlign: TextAlign.left,
//                    style: Theme.of(context)
//                        .textTheme
//                        .title
//                        .copyWith(color: Theme.of(context).primaryColor,),
//                  ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Utils.darkenColor(eventColor), shape: BoxShape.circle),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  event.rating.toString(),
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      color: eventColor),
                ),
              ),
            ),
//                ],
//              ),

            MoodCard(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
                children: <Widget>[
                  Text(
                    "Your Notes:",
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  ZefyrView(
                    document: NotusDocument.fromDelta(notesDelta),
                    imageDelegate: CustomImageDelegate(),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

