# pinggo

PingGo is a Flutter application for event attendance management, featuring location-based check-in and auto-checkout when the user leaves a defined radius.

## Getting Started

This project is a starting point for a Flutter application.

## Requirements

- **Flutter SDK:** `3.35.1`
- **Dart SDK:** Version bundled with Flutter 3.35.1
- **Firebase Project:** (for authentication & Firestore)

---

## Setup

### 1. Clone the repository:
```sh
git clone https://github.com/yourusername/pinggo.git
cd pinggo
```

### 2. Install dependencies:
```sh
flutter pub get
```

### 3. Add Firebase configuration (if using Firebase):
- Place `google-services.json` into `android/app/`
- Place `GoogleService-Info.plist` into `ios/Runner/`
`

### 4. Run the app:
```sh
flutter run
```

---

## Features

- Location-based event check-in and auto-checkout
- Firebase Authentication & Firestore support
- Attendance tracking
- Background location updates
- Simple, standard Flutter configuration

---

## Notes

- **Flutter version:** This project uses **Flutter 3.35.1** and the associated Dart SDK.  
  Please maintain this version to ensure compatibility and stability.  
  If upgrading, test thoroughly and update dependencies as needed.
- **Best practices:**
    - Use clean architecture and maintain separation of concerns.
    - Organize code into feature-based folders (e.g. `/features/home`, `/features/auth`).
    - Use dependency injection (GetIt).

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
