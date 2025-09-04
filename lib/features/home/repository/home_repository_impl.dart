import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinggo/core/data/local/local_storage.dart';
import 'package:pinggo/features/home/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final FirebaseFirestore _firestore;

  HomeRepositoryImpl(this._firestore);

  @override
  Stream<List<Map<String, dynamic>>> streamAllEvents() {
    return _firestore
        .collection('events')
        .snapshots()
        .map((query) => query.docs.map((doc) => {
      ...doc.data(),
      'id': doc.id,
    }).toList());
  }

  @override
  Future<int> getAttendanceCount(String eventId) async {
    final snapshot = await _firestore
        .collection('events')
        .doc(eventId)
        .collection('attendance')
        .get();
    return snapshot.docs.length;
  }
}
