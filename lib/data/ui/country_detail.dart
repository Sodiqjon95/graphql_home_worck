import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_home_worck/data/cubit/country_data_cubit/country_data_cubit.dart';

class CountryDetail extends StatefulWidget {
  const CountryDetail({this.code = "UZ", Key? key,  }) : super(key: key);

  final String code;

  @override
  State<CountryDetail> createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {

  @override
  void initState() {
    context.read<CountryDataCubit>().onCountryDataFetch(code: widget.code);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail  info"),),

      body: BlocBuilder<CountryDataCubit, CountryDataState >(
        builder: (context, state) {
          if(state is CountryDataInFailure){
            return Center(child: Text(state.errotText));
          }
          if(state is CountryDataInProgress){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is CountryDataInSuccess){
          return
            Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
            child: Column(
              children: [
                Text(state.infoCountryModel.emoji,style: const TextStyle(fontSize: 300),),
                Text("name: ${state.infoCountryModel.name}"),
                Text("native: ${state.infoCountryModel.native}"),
                Text("currency: ${state.infoCountryModel.currency}"),
                Text("capital: ${state.infoCountryModel.capital}"),
              ],
            ),

          );
          } else {
            return const SizedBox();
          }

        },
      ),
    );
  }
}
