import "package:flutter/material.dart";
import "package:mood_app/models/Scenario.dart";

class ScenarioPage extends StatelessWidget {
  final Scenario scenario;
  ScenarioPage(this.scenario);

  bool hasLongTitle = false;
  TextSpan titleSpan = TextSpan();

  @override
  Widget build(BuildContext context) {
    titleSpan = new TextSpan(
      text: scenario.title,
      style: Theme.of(context).textTheme.title,
    );

   // for determining title size
    var titlePainter = new TextPainter(
      text: titleSpan,
      maxLines: 1,
      textAlign: TextAlign.start,
      textDirection: Directionality.of(context),
    );
    titlePainter.layout(maxWidth: MediaQuery.of(context).size.width-160);
    // true if title will overflow screen (1 line)
    hasLongTitle = titlePainter.didExceedMaxLines;
    print(hasLongTitle);

    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0,
                expandedHeight: 200,
                backgroundColor: Theme.of(context).canvasColor,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                ],
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints size) {
                    var titleTextWidget = new RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      text: titleSpan,
                    );
                    // no parallax effect for titles too long
                    if (hasLongTitle) return Container();
                    return ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: size.maxWidth - 160),
                      child: titleTextWidget,
                    );
                  }),
                  background: Container(
                    color: Theme.of(context).primaryColor,
                  ),
                  collapseMode: CollapseMode.parallax,
                ),
              )
            ];
          },
          body: Container(
            child:ListView(
              children: <Widget>[
                _overviewWidget(context, scenario)
              ],
            ),
          ),
        ));
  }


  Widget _overviewWidget(BuildContext context, Scenario scenario){
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          hasLongTitle ? Container(
              width: MediaQuery.of(context).size.width - 40,
            child:  Text(
              scenario.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title.copyWith(
                fontSize: 35
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
