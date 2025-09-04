import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinggo/core/data/local/local_storage.dart';
import 'package:pinggo/core/data/local/local_storage_key.dart';
import 'package:pinggo/features/attendance_map/repository/map_repository.dart';

class MapRepositoryImpl extends MapRepository {
  final FirebaseFirestore _firestore;
  final LocalStorage _localStorage;

  MapRepositoryImpl(this._firestore, this._localStorage);

  @override
  Future<void> setLocation(Map<String, dynamic> data) async {
    final lat = double.parse(data['lat'].toString());
    final lon = double.parse(data['lon'].toString());
    final radius = double.parse(data['radius'].toString());

    await _firestore
        .collection('events')
        .doc(_localStorage.getString(LocalStorageKey.uid))
        .set({
          'lat': lat,
          'lon': lon,
          'radius': radius,
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
  }
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
  Future<void> addAttendance({
    required String eventId,
    required String userId,
    required String userName,
    required double lat,
    required double lon,
    required DateTime time,
  }) async {
    await _firestore
        .collection('events')
        .doc(eventId)
        .collection('attendance')
        .doc(userId)
        .set({
          'userId': userId,
          'userName': userName,
          'lat': lat,
          'lon': lon,
          'time': Timestamp.fromDate(time),
        }, SetOptions(merge: true));
  }
}
