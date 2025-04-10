import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'repositories/property_repository.dart';
import 'bloc/property_bloc.dart';
import 'bloc/property_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final propertyRepository = PropertyRepository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  PropertyBloc(propertyRepository: propertyRepository)
                    ..add(LoadProperties()),
        ),
      ],
      child: const HomzesApp(),
    ),
  );
}
