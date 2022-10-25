import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_home_worck/data/cubit/country_cubit.dart';
import 'package:graphql_home_worck/data/ui/country_detail.dart';

class CountryView extends StatelessWidget {
  const CountryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Country"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<CountryCubit, CountryState>(
          builder: (context, state) {
            if (state is CountryInProgress) {
              return const CircularProgressIndicator.adaptive();
            }
            if (state is CountryInSuccess) {
              return ListView.builder(
                itemCount: state.country.length,
                itemBuilder: (context, index) {
                  final country = state.country[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CountryDetail(code: state.country[index].code,);
                          },
                        ),
                      );
                    },
                    key: Key(country.code),
                    leading: Text(country.emoji),
                    title: Text(country.name),
                    trailing: Text(country.code),
                  );
                },
              );
            }
            return const Text('Oops something went wrong!');
          },
        ),
      ),
    );
  }
}
