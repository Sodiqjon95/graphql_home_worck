part of 'country_data_cubit.dart';

@immutable
abstract class CountryDataState {}

class CountryDataInitial extends CountryDataState {}
class CountryDataInProgress extends CountryDataState {}

class CountryDataInSuccess extends CountryDataState {
  CountryDataInSuccess({required this.infoCountryModel});
  final InfoCountryModel infoCountryModel;
}
class CountryDataInFailure extends CountryDataState {
  CountryDataInFailure({required this.errotText});
  String errotText;
}
