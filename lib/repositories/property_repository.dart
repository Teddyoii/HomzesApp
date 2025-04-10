import '../models/property.dart';
import '../services/firebase_service.dart';

class PropertyRepository {
  final FirebaseService _firebaseService = FirebaseService();

  Future<List<Property>> getProperties() async {
    return await _firebaseService.getProperties();
  }

  Future<List<Property>> getFeaturedProperties() async {
    return await _firebaseService.getFeaturedProperties();
  }

  Future<List<Property>> getNewOffers() async {
    return await _firebaseService.getNewOffers();
  }
}
