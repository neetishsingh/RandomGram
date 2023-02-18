import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AAYSAnalyticsFirebaseUser {
  AAYSAnalyticsFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

AAYSAnalyticsFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AAYSAnalyticsFirebaseUser> aAYSAnalyticsFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AAYSAnalyticsFirebaseUser>(
      (user) {
        currentUser = AAYSAnalyticsFirebaseUser(user);
        return currentUser!;
      },
    );
