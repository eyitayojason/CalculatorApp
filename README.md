# Calculator App

A modern, robust calculator application built with Flutter, featuring a clean UI and solid architectural patterns.

## Features

- **Basic Arithmetic**: Addition, subtraction, multiplication, and division.
- **Chained Calculations**: Perform continuous operations (e.g., `2 + 3 * 4` calculates as `(2+3)*4`).
- **Responsive UI**: Clean interface that works across multiple platforms.
- **State Management**: Uses the `Provider` package (MVVM pattern) for efficient state handling.
- **Unit Tested**: Comprehensive test coverage for calculation logic and view model state.

## Architecture

The project follows the **MVVM (Model-View-ViewModel)** architectural pattern to ensure separation of concerns and testability.

- **Model (`lib/core/`)**: Contains the core business logic (`CalculatorEngine`).
- **View (`lib/ui/screens/`)**: The UI components (`MyCalculatorApp`, `CalcDisplay`, `CalculatorButton`).
- **ViewModel (`lib/ui/viewmodels/`)**: Manages the state and exposes data to the UI (`CalculatorVm`).

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (Latest Stable)
- Dart SDK

### Installation

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/eyitayojason/CalculatorApp.git
    cd CalculatorApp
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Run the app**:
    ```bash
    flutter run
    ```

## Running Tests

The project includes unit tests for both the calculation engine and the view model.

Run all tests with:
```bash
flutter test
```

## Project Structure

```
lib/
├── core/
│   └── calc_engine.dart       # Core calculation logic
├── ui/
│   ├── screens/
│   │   ├── widgets/
│   │   │   ├── calc_display.dart
│   │   │   └── calulator_buttons.dart
│   │   └── calculator_app_input.dart
│   └── viewmodels/
│       └── calculator_vm.dart # State management
└── main.dart                  # Application entry point
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
