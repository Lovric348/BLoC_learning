part of 'smjesa_bloc.dart';

abstract class SmjesaEvent{
  get searchTerm => null;
}

class HastagSearch extends SmjesaEvent{
  String searchTerm = '';

  HastagSearch({required this.searchTerm});
}

