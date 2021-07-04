import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

//from new branch
FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();


Future<void> googleSignUp() async {
  try {
    final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email'
      ],
    );
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final User user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);

    return user;
  }catch (e) {
    print(e.message);
  }
}