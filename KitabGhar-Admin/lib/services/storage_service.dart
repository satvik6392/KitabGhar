import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class StorageService {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
      Future<void> uploadImage(XFile image) async{
        await storage
        .ref('product_images/${image.name}').putFile(File(image.path));
      }
      Future<String> getDownloadUrl(String imageName) async{
        String downloadUrl = await storage.ref('product_images/$imageName').getDownloadURL();
        return downloadUrl;
      }
}
