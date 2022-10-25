import 'package:bloc/bloc.dart';
import 'package:graphql_home_worck/data/api/country_api.dart';
import 'package:meta/meta.dart';

import '../models/country_model.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit({required CountryApi countryApi})
      : _countryApi = countryApi,
        super(CountryInitial());

  final CountryApi _countryApi;

  Future<void> onCountryFetchStarted(

      //string code
      )async{
    emit(CountryInProgress());
    try{
      final country = await _countryApi.getCountry();
      emit(CountryInSuccess(country));
    }catch(_){
      emit(CountryInFailure());
    }
  }

}
