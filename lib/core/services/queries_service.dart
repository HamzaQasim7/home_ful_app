/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lacewatch/core/services/firebase_service.dart';
import 'package:lacewatch/models/query.dart';

import 'firebase_service.dart';

class QueriesService extends FirebaseService<Query> {
  QueriesService()
      : super(
          collectionName: "queries",
          fromJson: Query.fromJson,
          toJson: (drug) => drug.toJson(),
        );

  Future<List<Query>> getQueries() async {
    List<Query> queries = await getAll();
    return queries;
  }
}
*/