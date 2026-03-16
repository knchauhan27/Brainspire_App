# Brainspire Mobile App

**A medical resource hub for MBBS students** 🏥📚

Brainspire is an AI-powered learning companion that provides comprehensive medical resources, previous year questions, clinical spotting exercises, and interactive learning tools for medical students.

## Features

- 📖 **Medical Resources**: Access comprehensive study materials across all MBBS subjects
- ❓ **Previous Year Questions (PYQ)**: Practice with actual MBBS exam questions
- 👁️ **Clinical Spotting**: Interactive spotting exercises for practical learning
- 🏷️ **Bookmarks**: Save and organize important content
- ⭐ **Premium Content**: Access advanced features and exclusive materials
- 📱 **Cross-Platform**: Available on iOS, Android, Web, macOS, Linux, and Windows

## Tech Stack

- **Frontend**: Flutter + Dart
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **Backend**: Supabase (Authentication, Database, Storage)
- **Architecture**: Clean Architecture with Feature-Based Structure

## Subjects Covered

- Anatomy
- Physiology
- Biochemistry
- Pathology
- Pharmacology
- Microbiology
- ENT
- Ophthalmology
- And more...

## Getting Started

### Prerequisites

- Flutter SDK: ^3.10.0
- Dart SDK: ^3.10.0
- IDE: VS Code, Android Studio, or Xcode

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/brainspire_mobile_app.git
   cd brainspire_mobile_app
   ```

2. **Install dependencies**:

   ```bash
   flutter pub get
   ```

3. **Generate code** (Riverpod + GoRouter):

   ```bash
   flutter pub run build_runner build
   ```

4. **Configure Supabase**:
   - Create a Supabase project at [supabase.com](https://supabase.com)
   - Add your URL and anon key to `lib/main.dart`:

   ```dart
   await Supabase.initialize(
     url: 'YOUR_SUPABASE_URL',
     anonKey: 'YOUR_ANON_KEY',
   );
   ```

5. **Run the app**:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── core/              # Shared kernel
│   ├── constants/     # App-wide constants
│   ├── errors/        # Error & failure models
│   ├── extensions/    # Dart extensions
│   ├── network/       # Supabase & API clients
│   ├── providers/     # Global Riverpod providers
│   ├── router/        # Navigation (GoRouter)
│   ├── services/      # Core services
│   └── utils/         # Utilities & helpers
│
├── features/          # Feature modules
│   ├── auth/          # Authentication
│   ├── home/          # Home screen & dashboard
│   ├── pyq/           # Previous year questions
│   ├── spotting/      # Clinical spotting
│   ├── bookmarks/     # Bookmarks
│   ├── premium/       # Premium features
│   └── onboarding/    # App onboarding
│
├── shared/            # Shared UI components
│   └── widgets/       # Reusable widgets
│
├── app.dart           # App root with routing
└── main.dart          # App entry point
```

## Architecture

This project follows **Clean Architecture** with **Feature-Based Folder Structure**:

- **Domain Layer**: Entities, repository interfaces, and use cases (business logic)
- **Data Layer**: Repository implementations, models, and data sources
- **Presentation Layer**: UI screens, widgets, and state management

For detailed architecture information, see [ARCHITECTURE.md](ARCHITECTURE.md).

## Development

### Code Generation

The project uses code generation for Riverpod providers and GoRouter routes:

```bash
# One-time build
flutter pub run build_runner build

# Watch mode (recommended during development)
flutter pub run build_runner watch
```

### Running Tests

```bash
# Run all tests
flutter test

# Run tests for a specific file
flutter test test/unit/auth_test.dart

# Run tests with coverage
flutter test --coverage
```

### Code Quality

```bash
# Analyze code
flutter analyze

# Format code
dart format lib

# Fix auto-fixable issues
dart fix lib --apply
```

## API Endpoints (Supabase Tables)

- `users` - User profiles and account info
- `subjects` - Medical subject data
- `questions` - PYQ questions
- `bookmarks` - User bookmarks
- `premium_subscriptions` - Premium status

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Development Guidelines

- Follow the Clean Architecture pattern
- Keep features independent and modular
- Use meaningful variable and function names
- Document public APIs
- Test critical business logic
- Keep commits small and focused

## Troubleshooting

### Build Issues

If you encounter build issues, try:

```bash
flutter clean
flutter pub get
flutter pub run build_runner build
flutter run
```

### Supabase Connection Issues

- Verify your Supabase credentials in `lib/main.dart`
- Check your internet connection
- Ensure Supabase project is active

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions and support:

- 📧 Email: support@brainspire.dev
- 🐛 Issues: [GitHub Issues](https://github.com/yourusername/brainspire_mobile_app/issues)
- 💬 Discussions: [GitHub Discussions](https://github.com/yourusername/brainspire_mobile_app/discussions)

## Acknowledgments

- Flutter team for the amazing framework
- Supabase for backend services
- All contributors and testers

---

Made with ❤️ by Brainspire Team
