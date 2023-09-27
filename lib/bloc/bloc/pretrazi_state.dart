part of 'pretrazi_bloc.dart';

class PretraziState extends Equatable {
  final List<String> istiStringovi;

  PretraziState({required this.istiStringovi});
  
  @override
  List<Object> get props => [];

factory PretraziState.initial() => PretraziState(istiStringovi: []);


}


