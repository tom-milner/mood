import "package:flutter/material.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mood_app/models/Category.dart';
import 'package:mood_app/pages/scenarios/CategoriesPage/CategoryCard.dart';
import "package:mood_app/blocs/CategoryBloc.dart";

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
                print("building");
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
                  itemCount: categorySnapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Category category = categorySnapshot.data[index];
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
}
