abstract class MapRepository{

  Future<void> setLocation(Map<String,dynamic> data);
  Stream<List<Map<String, dynamic>>> streamAllEvents();
  Future<void> addAttendance({
    required String eventId,
    required String userId,
    required String userName,
    required double lat,
    required double lon,
    required DateTime time,
  });


}