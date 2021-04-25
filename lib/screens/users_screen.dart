import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../service/graphql_service.dart';
import '../values/values.dart';
import '../widgets/UserCard.dart';

class UsersScreen extends StatefulWidget{

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  GraphQLService _qgService =  GetIt.I.get<GraphQLService>();

  @override
  Widget build(BuildContext context) {

    ///Screen height
    double sHeight = MediaQuery.of(context).size.height;

    ///Screen width
    double sWidth = MediaQuery.of(context).size.width;

   return Container(
     child: Query(options: QueryOptions(
         document: gql(_qgService.getUsersQuery())
     ), builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
       if (result.hasException) {
         return Text(result.exception.toString());
       }
       if (result.isLoading) {
         return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondaryElement),));
       }
       List users = result.data['users']['data'];
       return Container(
         height: (630/812)*sHeight,
         child: SingleChildScrollView(
           physics: ScrollPhysics(),
           child: ListView.builder(
               itemCount: users.length,
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
               itemBuilder: (context, index) {
                 final user = users[index];
                 return Center(child: UserCard(name: user["name"],mail: user["email"],profileURL: user["albums"]["data"][0]["photos"]["data"][0]["thumbnailUrl"],));
               }),
         ),
       );
     }),
   );
  }
}