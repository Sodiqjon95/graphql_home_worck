import 'package:graphql/client.dart';
import 'package:graphql_home_worck/data/models/info_country_model.dart';
import 'package:graphql_home_worck/data/quaries/country_data_query.dart';

class GetCountryDataRequestFailure implements Exception {}

class CountryApiData {
  const CountryApiData({required GraphQLClient graphQLClient}) : _graphQLClient = graphQLClient;

  factory CountryApiData.create() {
    final httpLink = HttpLink('https://countries.trevorblades.com/');
    final link = Link.from([httpLink]);
    return CountryApiData(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  final GraphQLClient _graphQLClient;


  Future<InfoCountryModel> getCountiesData({required String code}) async {
    final result = await _graphQLClient.query(
      QueryOptions(
        document: gql(getCountryData),
        variables: <String, dynamic>{'code': code},
      ),
    );
    if (result.hasException) {
      throw Exception();
    }
    print("CountyYYYY DATA aaaa ${result.data?["country"] as Map<String, dynamic>}");
    return InfoCountryModel.fromJson(result.data?["country"] as Map<String, dynamic>);
  }
}