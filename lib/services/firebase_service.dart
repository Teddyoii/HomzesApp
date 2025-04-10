import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/property.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch all properties
  Future<List<Property>> getProperties() async {
    try {
      final QuerySnapshot snapshot =
          await _firestore.collection('properties').get();

      if (snapshot.docs.isEmpty) {
        print('No properties found in Firestore');
        return [];
      }

      return snapshot.docs.map((doc) {
        return Property.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      print('Error fetching properties: $e');

      return [];
    }
  }

  // Fetch featured properties
  Future<List<Property>> getFeaturedProperties() async {
    try {
      final QuerySnapshot featuredSnapshot =
          await _firestore
              .collection('properties')
              .where('is_featured', isEqualTo: true)
              .get();

      if (featuredSnapshot.docs.isNotEmpty) {
        return featuredSnapshot.docs.map((doc) {
          return Property.fromJson(doc.data() as Map<String, dynamic>, doc.id);
        }).toList();
      }

      print('No featured properties found, providing fallback properties');
      final QuerySnapshot fallbackSnapshot =
          await _firestore.collection('properties').limit(2).get();

      return fallbackSnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;

        data['is_featured'] = true;
        return Property.fromJson(data, doc.id);
      }).toList();
    } catch (e) {
      print('Error fetching featured properties: $e');
      return [];
    }
  }

  // Fetch new offers
  Future<List<Property>> getNewOffers() async {
    try {
      final QuerySnapshot newSnapshot =
          await _firestore
              .collection('properties')
              .where('is_new', isEqualTo: true)
              .get();

      if (newSnapshot.docs.isNotEmpty) {
        return newSnapshot.docs.map((doc) {
          return Property.fromJson(doc.data() as Map<String, dynamic>, doc.id);
        }).toList();
      }

      print('No new offers found, providing fallback properties');
      final QuerySnapshot fallbackSnapshot =
          await _firestore.collection('properties').limit(3).get();

      return fallbackSnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;

        data['is_new'] = true;
        return Property.fromJson(data, doc.id);
      }).toList();
    } catch (e) {
      print('Error fetching new offers: $e');
      return [];
    }
  }
}
