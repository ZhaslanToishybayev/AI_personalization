import 'dart:async';

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/core/firebase/firebase_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFirebaseAuth extends Mock implements FirebaseAuth {}

class _MockUserCredential extends Mock implements UserCredential {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      const FirebaseOptions(
        apiKey: 'key',
        appId: '1:test',
        messagingSenderId: 'sender',
        projectId: 'project',
      ),
    );
  });

  group('FirebaseManager', () {
    test('initializes only once with provided options', () async {
      var callCount = 0;
      FirebaseOptions? capturedOptions;
      Future<void> initializer({FirebaseOptions? options}) async {
        callCount++;
        capturedOptions = options;
      }

      final manager = FirebaseManager(
        initializer: initializer,
        auth: _MockFirebaseAuth(),
        firestore: FakeFirebaseFirestore(),
      );

      const options = FirebaseOptions(
        apiKey: 'key',
        appId: '1:test',
        messagingSenderId: 'sender',
        projectId: 'project',
      );

      await manager.initialize(options: options);
      await manager.initialize(options: options);

      expect(callCount, 1);
      expect(capturedOptions, options);
    });

    test('throws when used before initialization', () async {
      final manager = FirebaseManager(
        initializer: ({FirebaseOptions? options}) async {},
        auth: _MockFirebaseAuth(),
        firestore: FakeFirebaseFirestore(),
      );

      await expectLater(manager.signInAnonymously(), throwsStateError);
    });

    test('delegates sign-in and auth stream', () async {
      final auth = _MockFirebaseAuth();
      final creds = _MockUserCredential();
      when(
        () => auth.signInWithCustomToken('token'),
      ).thenAnswer((_) => Future.value(creds));
      when(auth.signInAnonymously).thenAnswer((_) => Future.value(creds));
      when(auth.authStateChanges).thenAnswer((_) => Stream.value(null));

      final manager = FirebaseManager(
        initializer: ({FirebaseOptions? options}) async {},
        auth: auth,
        firestore: FakeFirebaseFirestore(),
      );
      await manager.initialize();

      final result = await manager.signInWithCustomToken('token');
      expect(result, creds);

      final anon = await manager.signInAnonymously();
      expect(anon, creds);

      expect(manager.authStateChanges(), emitsInOrder([null]));
      verify(() => auth.signInWithCustomToken('token')).called(1);
      verify(auth.signInAnonymously).called(1);
      verify(auth.authStateChanges).called(1);
    });

    test('returns user document reference', () async {
      final firestore = FakeFirebaseFirestore();

      final manager = FirebaseManager(
        initializer: ({FirebaseOptions? options}) async {},
        auth: _MockFirebaseAuth(),
        firestore: firestore,
      );
      await manager.initialize();

      final doc = manager.userDocument('user-1');
      expect(doc.path, 'users/user-1');
    });
  });
}
