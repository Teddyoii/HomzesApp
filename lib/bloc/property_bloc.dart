import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/property_repository.dart';
import 'property_event.dart';
import 'property_state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final PropertyRepository propertyRepository;

  PropertyBloc({required this.propertyRepository}) : super(PropertyInitial()) {
    on<LoadProperties>(_onLoadProperties);
    on<LoadFeaturedProperties>(_onLoadFeaturedProperties);
    on<LoadNewOffers>(_onLoadNewOffers);
  }

  Future<void> _onLoadProperties(
    LoadProperties event,
    Emitter<PropertyState> emit,
  ) async {
    emit(PropertyLoading());
    try {
      final properties = await propertyRepository.getProperties();
      final featuredProperties =
          await propertyRepository.getFeaturedProperties();
      final newOffers = await propertyRepository.getNewOffers();

      emit(
        PropertyLoaded(
          properties: properties,
          featuredProperties: featuredProperties,
          newOffers: newOffers,
        ),
      );
    } catch (e) {
      emit(PropertyError(e.toString()));
    }
  }

  Future<void> _onLoadFeaturedProperties(
    LoadFeaturedProperties event,
    Emitter<PropertyState> emit,
  ) async {
    if (state is PropertyLoaded) {
      try {
        final featuredProperties =
            await propertyRepository.getFeaturedProperties();
        emit(
          (state as PropertyLoaded).copyWith(
            featuredProperties: featuredProperties,
          ),
        );
      } catch (e) {
        emit(PropertyError(e.toString()));
      }
    }
  }

  Future<void> _onLoadNewOffers(
    LoadNewOffers event,
    Emitter<PropertyState> emit,
  ) async {
    if (state is PropertyLoaded) {
      try {
        final newOffers = await propertyRepository.getNewOffers();
        emit((state as PropertyLoaded).copyWith(newOffers: newOffers));
      } catch (e) {
        emit(PropertyError(e.toString()));
      }
    }
  }
}
