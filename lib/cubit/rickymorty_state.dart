part of 'rickymorty_cubit.dart';

@immutable
abstract class RickymortyState {}

class RickymortyInitial extends RickymortyState {}

class RickymortyLoading extends RickymortyState {}

class RickymortySuccess extends RickymortyState {

  final Response<dynamic> response;

  RickymortySuccess(this.response);

}

class RickymortyError extends RickymortyState {
  final error;

  RickymortyError(this.error);



}
