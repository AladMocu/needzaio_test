

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

///GraphQL service provider
///
class GraphQLService{

  ///GraphQL Server Location
  ///
  static final HttpLink server = HttpLink("https://graphqlzero.almansi.me/api");

  ///GraphQL Client
  ///
  static GraphQLClient client;

  ///Initialization of the GraphQL Client
  ///
  static ValueNotifier<GraphQLClient> initiailizeClient() {

     GraphQLClient tClient = GraphQLClient(
      cache: GraphQLCache(),
      link: server,
    );
    ValueNotifier<GraphQLClient> vnClient = ValueNotifier(
        tClient
    );
    client=tClient;

    return vnClient;

  }

  ///GraphQL Client
  ///
  /// [uname]User name
  /// [password]User Password
  ///
  /// Returns null if everything is correct, a error string otherwise
  Future<String> signIn(String uname, String password) async {
    String query="""
                  {
                  users(
                      options:{
                        search:{
                          q:"$uname"
                        }
                      })
                  {
                    data{
                      username
                      phone
                    }
                  }
                }""";

    QueryResult result = await client.query(QueryOptions(
      document: gql(query),));
    if(result.hasException)
      {
        return "There was a problem with your request";
      }
    var userList =result.data['users']['data'] as List<dynamic>;

    if(userList.isEmpty)
      {
        return "There is no user matching that name.";
      }
    if(userList[0]['phone']!=password)
      {
        return "You have entered an invalid username or password";
      }
    return null;

  }

  /// Query used to get the users inside the app. This Query is not handled by
  /// this class as it can be integrated within the view using the Query widget
  String getUsersQuery()
  {
    String query = """{
      users {
        data {
          name
          email
          albums(options: { paginate: { limit: 1 } }) {
            data {
              title
              photos(options: { paginate: { limit: 1 } }) {
                data {
                  thumbnailUrl
                }
              }
            }
          }
        }
      }
    }
      """;
    return query;
  }






}