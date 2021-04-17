import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon/Models/ItemFirebase.dart';
import 'package:hackathon/Models/UserModelFirebase.dart';

class UsersDatabase {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  // Create user data
  Future<void> createUser(String fullName, String email, bool clientType) {
    String type;

    if (clientType = true) {
      type = "b2b";
    } else {
      type = "b2c";
    }

    var firebaseUser = FirebaseAuth.instance.currentUser;
    return usersCollection
        .doc(firebaseUser.uid.toString())
        .set({
          "full_name": fullName,
          "client_type": type,
          "email": email,
          "shopCart": [],
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // Get general data
  Future<dynamic> getData() async {
    firestore.collection("users").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
  }

  Future<ItemFirebase> getItemData(String itemId) async {
    try {
      return await firestore
          .collection("items")
          .doc(itemId)
          .get()
          .then((value) {
        return new ItemFirebase(
          id: itemId,
          name: value.get("name"),
          description: value.get("description"),
          imgUrl: value.get("img"),
          isLocal: value.get("isLocal"),
          nutritionalData: value.get("nutritional_data"),
        );
      });
    } catch (StateErrror) {
      return null;
    }
  }

  // Get the user data
  Future<UserModelFirestore> getUserData() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    return await usersCollection.doc(firebaseUser.uid).get().then((value) {
      return new UserModelFirestore(
          uid: firebaseUser.uid,
          email: value.data()["email"],
          name: value.data()["full_name"],
          items: value.data()["shopCart"]);
    });
  }
}
