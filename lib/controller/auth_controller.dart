import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  //function to pick image from gallery or camera

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return _file.readAsBytes();
    } else {
      print('No Image Selected');
    }
  }

  //function to upload images to the storage
  _uploadImageToStorage(Uint8List? image) {
    Reference ref =
        _firebaseStorage.ref().child('profiles').child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.
  }

  Future<String> signUpUsers(
      String fullName, String email, String password, Uint8List image) async {
    String res = '';
    try {
      if (fullName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        _uploadImageToStorage(image);
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'fullName': fullName,
          'email': email,
        });
        res = 'Success';
      } else {
        res = 'Please enter the required fields';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
