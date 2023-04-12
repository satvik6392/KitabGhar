import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository{
final FirebaseFirestore _firebaseFirestore;
CategoryRepository({FirebaseFirestore? firebaseFirestore}) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore.collection('category').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    });
  }

}