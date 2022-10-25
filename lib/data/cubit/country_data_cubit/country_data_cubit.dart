import 'package:bloc/bloc.dart';
import 'package:graphql_home_worck/data/api/country_data.dart';
import 'package:graphql_home_worck/data/models/info_country_model.dart';
import 'package:meta/meta.dart';

part 'country_data_state.dart';

class CountryDataCubit extends Cubit<CountryDataState> {
  CountryDataCubit({required CountryApiData countryApiData})
      : _countryApiData = countryApiData,
        super(CountryDataInitial());

  final CountryApiData _countryApiData;

  Future<void> onCountryDataFetch({
    required String code
  })async{
    emit(CountryDataInProgress());
    try{
      final countryData = await _countryApiData.getCountiesData(code: code);
      emit(CountryDataInSuccess(infoCountryModel: countryData));
    }catch(e){
      emit(CountryDataInFailure(errotText: e.toString()));
    }
  }
}
