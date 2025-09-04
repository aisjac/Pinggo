abstract class HomeRepository {
  Stream<List<Map<String, dynamic>>> streamAllEvents();
  Future<int> getAttendanceCount(String eventId);
}
