# Brainspire Mobile App - Architecture Guide

## Project Overview

Brainspire is an AI-powered medical learning companion for MBBS students. This Flutter application provides access to medical resources, previous year questions, spotting exercises, and more.

## Architecture Pattern

This project follows **Clean Architecture** with **Feature-Based Folder Structure**:

```
lib/
├── core/              # Shared kernel - used by all features
│   ├── constants/     # App-wide constants
│   ├── errors/        # Exception and failure models
│   ├── extensions/    # Dart extensions for BuildContext, etc.
│   ├── network/       # Network layer (Supabase client, API client)
│   ├── providers/     # Global Riverpod providers
│   ├── router/        # Navigation (GoRouter setup)
│   ├── services/      # Core services (device fingerprint, PDF export, storage)
│   └── utils/         # Utility functions (validators, debouncer)
│
├── features/          # Feature modules (scalable, independent)
│   ├── auth/          # Authentication feature
│   │   ├── data/      # Repository implementation, models, data sources
│   │   ├── domain/    # Entities, repository interfaces, use cases
│   │   └── presentations/ # UI screens, providers, widgets
│   │
│   ├── home/          # Home/Dashboard feature
│   ├── pyq/           # Previous Year Questions feature
│   ├── spotting/      # Clinical spotting exercises
│   ├── bookmarks/     # Bookmarks feature
│   ├── premium/       # Premium content & settings
│   ├── practicals/    # Practical exercises
│   ├── tray_viva/     # Tray viva feature
│   └── onboarding/    # Onboarding feature
│
├── shared/            # Shared UI components
│   └── widgets/       # Reusable widgets
│
├── app.dart           # App root widget (with GoRouter setup)
└── main.dart          # Entry point with Supabase initialization
```

## Key Packages

- **flutter_riverpod**: State management & dependency injection
- **go_router**: Type-safe navigation
- **supabase_flutter**: Backend (Authentication, Database, Storage)
- **device_info_plus**: Device information
- **pdf / printing**: PDF generation and printing

## Architecture Layers

### 1. **Data Layer** (`features/*/data/`)

- Repositories (implementation)
- Models (JSON serializable entities)
- Data sources (remote/local)
- Exception handling

### 2. **Domain Layer** (`features/*/domain/`)

- Entities (core business objects)
- Repository interfaces
- Use cases (business logic)
- Failures (result types)

### 3. **Presentation Layer** (`features/*/presentations/`)

- Screens (pages/routes)
- Widgets (UI components)
- Providers (state management)
- View models (if needed)

## State Management Strategy

### Riverpod Providers

**Global Providers** (`core/providers/app_providers.dart`):

- `supabaseClientProvider`: Supabase client instance
- `authStateStream`: Auth state changes
- `currentUser`: Currently logged-in user
- `userId`: Current user ID
- `isUserAuthenticated`: Auth status

**Feature Providers** (`features/*/presentation/providers/`):

- Feature-specific state management
- Generated code from `@riverpod` annotations

## Navigation Flow

```
Onboarding → Login/Signup → Avatar Picker → Home
                                            ├── PyQ
                                            ├── Spotting
                                            ├── Bookmarks
                                            ├── Premium
                                            └── Settings
```

Routes are defined in `core/router/app_router.dart` using GoRouter's typed routes.

**Extension Method** for easy navigation:

```dart
context.push<T>(route);   // Push new route
context.go<T>(route);     // Replace current route
```

## Error Handling

**Custom Exceptions** (`core/errors/app_exception.dart`):

- `AuthException` - Authentication failures
- `NetworkException` - Network issues
- `DataException` - Database/API errors
- `StorageException` - Storage issues
- `PDFGenerationException` - PDF generation errors

**Failures** (`core/errors/failure.dart`):

- Used for `Either<Failure, Success>` pattern in repositories
- Map exceptions to user-friendly failure types

## Supabase Integration

**Initialization** (`lib/main.dart`):

```dart
await Supabase.initialize(
  url: 'YOUR_SUPABASE_URL',
  anonKey: 'YOUR_ANON_KEY',
);
```

**API Client** (`core/network/api_client.dart`):

- Built-in CRUD methods
- Exception mapping
- Automatic error handling

## Build & Generation

Generated files from annotations:

```bash
# Generate Riverpod providers and GoRouter routes
flutter pub run build_runner build

# Watch for changes during development
flutter pub run build_runner watch
```

## Best Practices

1. **Separation of Concerns**
   - Keep business logic in domain layer
   - Presentation handles only UI state
   - Data layer handles API/storage

2. **Error Handling**
   - Always wrap API calls in try-catch
   - Map exceptions to failures
   - Return Either<Failure, Success>

3. **Navigation**
   - Use typed routes for type safety
   - Avoid BuildContext for navigation when possible
   - Use extension methods for cleaner code

4. **State Management**
   - Use `@riverpod` for simple, cacheable state
   - Use `StateNotifier` for complex stateful logic
   - Keep providers focused and single-purpose

5. **Code Organization**
   - One feature per folder
   - Each feature is independent and reusable
   - Shared code goes in `core/` or `shared/`

## Setup Instructions

1. **Install dependencies**:

   ```bash
   flutter pub get
   ```

2. **Generate code**:

   ```bash
   flutter pub run build_runner build
   ```

3. **Configure Supabase**:
   - Add your Supabase URL and anon key to `lib/main.dart`
   - Or use environment variables

4. **Run the app**:
   ```bash
   flutter run
   ```

## Development Workflow

1. Create a new feature folder: `lib/features/feature_name/`
2. Structure: `data/`, `domain/`, `presentations/`
3. Define entities in domain layer
4. Implement repositories in data layer
5. Create screens in presentations layer
6. Add routes in `core/router/app_router.dart`
7. Run code generation: `flutter pub run build_runner build`

## Contributing

- Follow the Clean Architecture pattern
- Keep features independent
- Write meaningful commit messages
- Document public APIs
- Test critical business logic

---

For more information on Flutter architecture patterns, visit:

- [Flutter Architecture](https://resocoder.com/flutter-clean-architecture)
- [Riverpod Documentation](https://riverpod.dev)
- [GoRouter Documentation](https://docs.go-router.io)
