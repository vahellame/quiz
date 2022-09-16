import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/quiz/models/models.dart';

class FirebaseAPI {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveResult(ResultModel result) async {
    await _db.collection('results').add(result.toJson());
  }
}
