import 'dart:async';

class FilterScenariosBloc {
  // stream - only need one listener
  final _searchController = StreamController<String>();

  // output stream
  get filterQuery => _searchController.stream;

  FilterScenariosBloc() {
    doFilter(" ");
  }

  dispose() {
    // close the stream when not in use to save resources
    _searchController.close();
  }

  doFilter(String query) {
    print("doFilter query: $query");
    _searchController.sink.add(query);
  }
}
