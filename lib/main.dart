import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_home_worck/data/api/country_api.dart';
import 'package:graphql_home_worck/data/api/country_data.dart';
import 'package:graphql_home_worck/data/cubit/country_cubit.dart';
import 'package:graphql_home_worck/data/cubit/country_data_cubit/country_data_cubit.dart';
import 'package:graphql_home_worck/data/ui/country_detail.dart';
import 'package:graphql_home_worck/data/ui/country_view.dart';

void main() {
  runApp(App(countryApi: CountryApi.create(), countryApiData: CountryApiData.create(),),);
}

class App extends StatelessWidget {
  const App({Key? key, required this.countryApi, required this.countryApiData}) : super(key: key);

  final CountryApi countryApi;
  final CountryApiData countryApiData;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) =>
        CountryCubit(countryApi: countryApi)
          ..onCountryFetchStarted(),
      ),
      BlocProvider(
        create: (_) =>
            CountryDataCubit(countryApiData: countryApiData),
      ),
    ], child: MyApp(),);
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CountryView()
    );
  }
}


