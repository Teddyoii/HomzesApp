import 'package:equatable/equatable.dart';

abstract class PropertyEvent extends Equatable {
  const PropertyEvent();

  @override
  List<Object> get props => [];
}

class LoadProperties extends PropertyEvent {}
class LoadFeaturedProperties extends PropertyEvent {}
class LoadNewOffers extends PropertyEvent {}
