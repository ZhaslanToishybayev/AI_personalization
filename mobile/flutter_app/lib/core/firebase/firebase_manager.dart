import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseManagerProvider = Provider<FirebaseManager>((ref) {
  return FirebaseManager(
    initializer: Firebase.initializeApp,
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
});

class FirebaseManager {
  FirebaseManager({
    required FirebaseInitializer initializer,
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  }) : _initializer = initializer,
       _auth = auth,
       _firestore = firestore;

  final FirebaseInitializer _initializer;
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  bool _initialized = false;

  Future<void> initialize({FirebaseOptions? options}) async {
    if (_initialized) return;
    await _initializer(options: options);
    _initialized = true;
  }

  Future<UserCredential> signInWithCustomToken(String token) async {
    _ensureInitialized();
    return _auth.signInWithCustomToken(token);
  }

  Future<UserCredential> signInAnonymously() async {
    _ensureInitialized();
    return _auth.signInAnonymously();
  }

  Stream<User?> authStateChanges() {
    _ensureInitialized();
    return _auth.authStateChanges();
  }

  DocumentReference<Map<String, dynamic>> userDocument(String userId) {
    _ensureInitialized();
    return _firestore.collection('users').doc(userId);
  }

  void _ensureInitialized() {
    if (!_initialized) {
      throw StateError('FirebaseManager used before initialize()');
    }
  }
}

typedef FirebaseInitializer = Future<void> Function({FirebaseOptions? options});
