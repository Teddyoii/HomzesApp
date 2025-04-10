# 🏠 Homzes - Flutter & Firebase Assignment

This project is a real estate-themed mobile application built with **Flutter** and integrated with **Firebase**. It showcases properties using dynamic data and follows a modern UI based on the provided [Figma design](https://www.figma.com/design/4OLYEBnjUdpa5mKKnXsTvb/Homzes-No-Image).

## 📱 Features

- 🔥 Firebase integration to fetch and display real-time property listings
- 🎯 Responsive UI based on Figma (3 Screens)
- ➕ Navigate to Search & Catalog screens with animated transitions
- 🧱 BLoC state management for clean and scalable architecture
- 🧭 Navigation setup using named routes
- 🖼️ CDN-hosted images for fast loading
- ✅ Follows Clean Architecture principles

## 🚀 Screens

1. **Welcome Screen** – Entry point with options to sign up.
2. **Search and Catalog Screen 1** – Displays a list of properties.
3. **Search and Catalog Screen 3** – Displays a different layout with animation.

_Screenshots available in the repository_

## 🛠️ Tech Stack

- Flutter 3.x
- Dart
- Firebase (Firestore)
- BLoC (flutter_bloc)
- Firebase Core & Firestore packages
- Responsive Design Utilities


## 📂 Folder Structure (Clean Architecture)

```
lib/
├── bloc/                  # BLoC state management (cubits, blocs, states)
├── models/                # Data models (e.g., Property)
├── repositories/          # Firebase and data abstraction layer
├── screens/               # App screens (Welcome, Search, Catalog)
├── services/              # Firebase services and API integrations
├── widgets/               # Reusable UI components
├── app.dart               # App-wide setup and routing
├── firebase_options.dart  # Firebase initialization config
└── main.dart              # App entry point

```

## 💡 Extras

All navigation is animated and triggered via button taps.

Data is fetched in real-time from Firestore using a well-structured BLoC pattern.

Screens are responsive and adaptive to different screen sizes.

## 📸 Screenshots


![Screenshot_1744287252](https://github.com/user-attachments/assets/44e8816e-0936-4f67-a767-14b16642660d)
![Screenshot_1744287258](https://github.com/user-attachments/assets/75b1a869-7a80-4592-ae8a-de38b83c72a1)
![Screenshot_1744287255](https://github.com/user-attachments/assets/8e83674b-ed27-4773-b21c-3d1a2c95a70d)
![Data Collection](https://github.com/user-attachments/assets/795eed92-26f4-40f7-9ab3-ea7c8f3e843b)




For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

