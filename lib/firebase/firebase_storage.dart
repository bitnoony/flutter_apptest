import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageProvider{
  final FirebaseStorage _firebaseStorage = FirebaseStorage();

  Future<StorageTaskSnapshot> uploadImg(File image, String path) {
    final StorageReference storageReference = _firebaseStorage.ref().child(path);
    final StorageUploadTask uploadTask = storageReference.putFile(image);

    return uploadTask.onComplete;
  }
}

final StorageProvider storageProvider = StorageProvider();