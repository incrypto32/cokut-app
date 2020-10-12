part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchResults extends SearchState {
  final Map<String, dynamic> results;

  List<Restaurant> get restaurants => results["restaurants"]?.toList();
  List<Meal> get meals => results["meals"]?.toList();

  SearchResults(this.results);
}

class SearchError extends SearchState {
  final String message;
  final bool mealsEmpty;
  SearchError(this.message, {this.mealsEmpty});
}
