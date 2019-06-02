import "package:flutter/material.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mood_app/models/Category.dart';
import 'package:mood_app/pages/scenarios/CategoriesPage/CategoryCard.dart';
import "package:mood_app/blocs/CategoryBloc.dart";
import 'package:mood_app/pages/scenarios/ScenariosPage/ViewScenariosPage.dart';
import 'package:mood_app/utils/Utils.dart';
import 'package:mood_app/widgets/MoodCard.dart';

// class to display scenarios
class CategoriesList extends StatefulWidget {
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final _categoryBloc = CategoryBloc();

  Widget _buildCategoryList(BuildContext context) {
    return StreamBuilder(
        stream: _categoryBloc.categories,
        builder: (BuildContext context, AsyncSnapshot categorySnapshot) {
          if (!categorySnapshot.hasData) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
          // GRID IMPLEMENTATION
          return StaggeredGridView.countBuilder(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 8,
            shrinkWrap: true,
            itemCount: (categorySnapshot.data.length + 1),
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) return _buildFavouritesTile();
              Category category = categorySnapshot.data[index - 1];
              return CategoryCard(category);
            },
            staggeredTileBuilder: (int index) {
              return StaggeredTile.count(4, 3);
            },
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return _buildCategoryList(context);
  }

  @override
  void dispose() {
    _categoryBloc.dispose();
    super.dispose();
  }

  Widget _buildFavouritesTile() {
    Color primaryColor = Theme.of(context).primaryColor;
    Color primaryColorDark = Utils.darkenColor(Theme.of(context).primaryColor);

    return GestureDetector(
      onTap: () {
        return Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ViewScenariosPage(isFavouritesPage: true,);
        }));
      },
      child: Container(
        child: MoodCard(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [primaryColor, primaryColorDark])),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Icon(
                      Icons.favorite,
                      size: 50,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  FittedBox(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Favourites",
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
