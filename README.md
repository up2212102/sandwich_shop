# Sandwich Shop App

A modern Flutter app for building and customizing sandwich orders. This project demonstrates clean architecture, state management, and a user-friendly interface for a sandwich shop ordering experience.

## Features
- Select sandwich size (footlong or six-inch)
- Choose bread type (white, wheat, wholemeal)
- Add or remove sandwiches with quantity limits
- Add special notes to your order (e.g., "no onions", "extra pickles")
- Responsive UI with custom styles
- All business logic separated into repositories
- Comprehensive widget and repository tests

## Installation & Setup

### Prerequisites
- Windows, macOS, or Linux
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x recommended)
- [Dart SDK](https://dart.dev/get-dart) (usually included with Flutter)
- Git
- An editor like [VS Code](https://code.visualstudio.com/) or Android Studio

### Getting Started
1. **Clone the repository:**
   ```sh
   git clone <https://github.com/up2212102/sandwich_shop.git>
   cd sandwich_shop
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Run the app:**
   ```sh
   flutter run
   ```
   You can run on an emulator, simulator, or a connected device.

## Usage
- Use the switch to toggle between footlong and six-inch sandwiches.
- Select your preferred bread type from the dropdown menu.
- Enter any special requests in the note field.
- Use the Add/Remove buttons to adjust the quantity (cannot go below 0 or above the max).
- The order summary updates live with your selections and notes.

### Running Tests
To run all widget and repository tests:
```sh
flutter test
```

## Project Structure
```
lib/
  main.dart                # App entry point and UI
  views/
    app_styles.dart        # Shared text styles
  repositories/
    order_repository.dart  # Business logic for order state

test/
  views/widget_test.dart   # Widget and integration tests
  repositories/order_repository_test.dart # Unit tests for order logic
```

- **main.dart**: Contains the main app, UI, and state wiring
- **OrderRepository**: Handles quantity logic and business rules
- **OrderItemDisplay**: Displays the current order summary
- **StyledButton**: Custom button widget with icon and style
- **app_styles.dart**: Centralized text styles for consistency

## Technologies Used
- Flutter (Material Design)
- Dart
- VS Code or Android Studio
- Standard Flutter testing tools

## Known Issues / Future Improvements
- No persistent storage (orders are not saved between sessions)
- No backend integration (local-only demo)
- UI could be enhanced with images or animations
- Accessibility improvements

## Contact
**Author:** Matthew Bitalac  
Email: up2212102@myport.ac.uk / Github Username: up2212102

Feel free to reach out for questions, suggestions, or contributions.
