abstract class AuthRepository{

  Future<void> saveLoginStatus(bool value);
  bool isLoggedIn();
  Future<void> logout();
  Future<void> doLogin(Map<String,dynamic> data);
  Future<void> doRegistration(Map<String,dynamic> data);
  Future<void> getProfile();



}