part of 'country_cubit.dart';

@immutable
abstract class CountryState {}

class CountryInitial extends CountryState {}
class CountryInProgress extends CountryState {}

class CountryInSuccess extends CountryState {
  CountryInSuccess(this.country);

  final List<CountryModel> country;
}
class CountryInFailure extends CountryState {}
