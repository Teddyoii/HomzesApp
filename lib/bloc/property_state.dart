import 'package:equatable/equatable.dart';
import '../models/property.dart';

abstract class PropertyState extends Equatable {
  const PropertyState();
  
  @override
  List<Object> get props => [];
}

class PropertyInitial extends PropertyState {}

class PropertyLoading extends PropertyState {}

class PropertyLoaded extends PropertyState {
  final List<Property> properties;
  final List<Property> featuredProperties;
  final List<Property> newOffers;
  
  const PropertyLoaded({
    this.properties = const [],
    this.featuredProperties = const [],
    this.newOffers = const [],
  });
  
  PropertyLoaded copyWith({
    List<Property>? properties,
    List<Property>? featuredProperties,
    List<Property>? newOffers,
  }) {
    return PropertyLoaded(
      properties: properties ?? this.properties,
      featuredProperties: featuredProperties ?? this.featuredProperties,
      newOffers: newOffers ?? this.newOffers,
    );
  }
  
  @override
  List<Object> get props => [properties, featuredProperties, newOffers];
}

class PropertyError extends PropertyState {
  final String message;
  
  const PropertyError(this.message);
  
  @override
  List<Object> get props => [message];
}