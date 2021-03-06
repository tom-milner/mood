import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:mood_app/models/Event/Event.dart';
import 'package:mood_app/models/Event/Tag.dart';
import 'package:mood_app/services/EventService/TagService.dart';
import 'package:mood_app/utils/Utils.dart';
import 'package:mood_app/widgets/CustomImageDelegate.dart';
import 'package:mood_app/widgets/MoodCard.dart';
import 'package:mood_app/widgets/MoodTagBox.dart';
import 'package:quill_delta/quill_delta.dart';
import "package:zefyr/zefyr.dart";


class ViewEventPage extends StatelessWidget {
  TagService _tagService = TagService();

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
          shrinkWrap: true,
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
                  ),
                ],
              ),
            ),
            _buildTagsContainer(event)
          ],
        ));
  }

  FutureBuilder _buildTagsContainer(Event event) {
    return FutureBuilder(
      future: _tagService.getTagsFromEvent(event),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return Container(
          height: 50,
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildTagBox(context, event.tags[index]);
            },
          ),
        );
      },
    );
  }

  Widget _buildTagBox(BuildContext context, Tag tag) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Theme.of(context).primaryColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
      margin: EdgeInsets.only(right: 5),
      alignment: Alignment.center,
      child: Text(
        tag.title,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .body1
            .copyWith(color: Theme.of(context).buttonColor),
      ),
    );
  }
}
