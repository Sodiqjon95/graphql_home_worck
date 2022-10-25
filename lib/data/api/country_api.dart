import 'package:graphql/client.dart';
import 'package:graphql_home_worck/data/models/country_model.dart';
import 'package:graphql_home_worck/data/quaries/get_country.dart';

class GetCountryRequestFailure implements Exception {}

class CountryApi {
  const CountryApi({required GraphQLClient graphQLClient}) : _graphQLClient = graphQLClient;

  factory CountryApi.create() {
    final httpLink = HttpLink('https://countries.trevorblades.com');
    final link = Link.from([httpLink]);
    return CountryApi(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  final GraphQLClient _graphQLClient;

  Future<List<CountryModel>> getCountry() async {
    final result = await _graphQLClient.query(QueryOptions(document: gql(getCountryQuery)));
    if (result.hasException) throw GetCountryRequestFailure();
    final data = result.data?['countries'] as List;
    return data.map((dynamic e) => CountryModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}
