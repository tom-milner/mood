import "package:flutter/material.dart";
import "package:mood_app/models/Scenario.dart";
import 'package:mood_app/utils/Utils.dart';
import "package:mood_app/services/ScenarioService.dart";
import 'package:mood_app/widgets/MoodCard.dart';

class ScenarioPage extends StatefulWidget {
  final Scenario scenario;
  ScenarioPage(this.scenario);

  _ScenarioPageState createState() => _ScenarioPageState();
}

class _ScenarioPageState extends State<ScenarioPage> {
  ScenarioService _scenarioService = ScenarioService();
  bool isFavourite;
  bool hasLongTitle = false;
  TextSpan titleSpan = TextSpan();

  @override
  void initState() {
    isFavourite = widget.scenario.isFavourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    titleSpan = new TextSpan(
      text: widget.scenario.title,
      style: Theme.of(context).textTheme.title,
    );

    // for determining title size
    var titlePainter = new TextPainter(
      text: titleSpan,
      maxLines: 1,
      textAlign: TextAlign.start,
      textDirection: Directionality.of(context),
    );
    titlePainter.layout(maxWidth: MediaQuery.of(context).size.width - 160);
    // true if title will overflow screen (1 line)
    hasLongTitle = titlePainter.didExceedMaxLines;

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
                    icon: Icon(
                        isFavourite ? Icons.favorite : Icons.favorite_border),
                    color: Theme.of(context).primaryColor,
                    onPressed: () async {
                      await _scenarioService.toggleFavourite(widget.scenario);
                      setState(() {
                        isFavourite = !isFavourite;
                        Scaffold.of(context)
                            .showSnackBar(_buildSnackBarWidget(isFavourite));
                      });
                    },
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
                    color: Utils.lightenColor(Theme.of(context).primaryColor),
                  ),
                  collapseMode: CollapseMode.parallax,
                ),
              )
            ];
          },
          body: Container(
            child: ListView(
              children: <Widget>[
                _buildTitleWidget(context, widget.scenario),
                _buildContentWidget(context, widget.scenario)
              ],
            ),
          ),
        ));
  }

  Widget _buildTitleWidget(BuildContext context, Scenario scenario) {
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          hasLongTitle
              ? Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Text(scenario.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline),
                )
              : Container(),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              scenario.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title.copyWith(
                  color: Utils.darkenColor(Theme.of(context).primaryColor)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentWidget(BuildContext context, Scenario scenario) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        scenario.content,
        style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20),
      ),
    );
  }

  Widget _buildSnackBarWidget(bool isFavorite) {
    return new SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: Theme.of(context).primaryColor,
      content: Text(
        isFavorite ? "Added to favourites" : "Removed from favourites",
        style: Theme.of(context).textTheme.title.copyWith(
          color: Colors.white
        ),
      ),
    );
  }
}
