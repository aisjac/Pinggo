import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinggo/core/data/local/local_storage.dart';
import 'package:pinggo/core/data/local/local_storage_key.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final LocalStorage _localStorage;

  AuthRepositoryImpl(this._auth, this._firestore, this._localStorage);

  @override
  Future<void> saveLoginStatus(bool value) async {
    await _localStorage.setBool(LocalStorageKey.isLoggedIn, value);
  }

  @override
  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
    await _localStorage.clear();
  }

  @override
  Future<void> doLogin(Map<String, dynamic> data) async {
    final email = data['email'] as String;
    final password = data['password'] as String;

    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    await saveLoginStatus(true);
    await _localStorage.setString(LocalStorageKey.uid, credential.user!.uid);
  }

  @override
  Future<void> doRegistration(Map<String, dynamic> data) async {
    final email = data['email'] as String;
    final password = data['password'] as String;
    final role = data['role'] as String;
    final username = data['username'] as String;

    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = credential.user!.uid;

    await _firestore.collection('users').doc(uid).set({
      'email': email,
      'role': role,
      'username': username,
      'createdAt': FieldValue.serverTimestamp(),
    });


  }

  @override
  Future<void> getProfile() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) throw Exception("User not logged in");

    final doc = await _firestore.collection('users').doc(uid).get();
    final profileData = doc.data();

    print(profileData);

    if (profileData != null) {
      await _localStorage.setString(LocalStorageKey.userEmail,  profileData['email']);
      await _localStorage.setString(LocalStorageKey.userRole,  profileData['role']);
      await _localStorage.setString(LocalStorageKey.userName,  profileData['username']);
    }
  }

  Future<void> logoutUser() async {
    await FirebaseAuth.instance.signOut();
    await _localStorage.clear();
  }



}
