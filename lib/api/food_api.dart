
import 'package:driver/model/user.dart';
import 'package:driver/notifier/auth_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';

login(UserData user, AuthNotifier authNotifier) async {
  UserCredential authResult = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((error) => print(error.code));

  if (authResult != null) {
    User firebaseUser = authResult.user;

    if (firebaseUser != null) {
      print("Log In: $firebaseUser");
      authNotifier.setUser(authResult.user);
    }
  }
}

signUp(UserData user, AuthNotifier authNotifier) async {
  UserCredential authResult = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((error) => print(error.code));

  if (authResult != null) {
    User firebaseUser = authResult.user;

    if (firebaseUser != null) {
      await firebaseUser.updateProfile(displayName: user.displayDriverName);
      await firebaseUser.reload();

      print("Sign up: $firebaseUser");

      User currentUser = FirebaseAuth.instance.currentUser;
      authNotifier.setUser(currentUser);
    }
  }
}

signOut(User firebaseUser) async {
  await FirebaseAuth.instance.signOut().catchError((error) => print(error.code));
}

initializeCurrentUser(AuthNotifier authNotifier) async {
  User firebaseUser = FirebaseAuth.instance.currentUser;
  if (firebaseUser != null) {
    print(firebaseUser);
    authNotifier.setUser(firebaseUser);
  }
}