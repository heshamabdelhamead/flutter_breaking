# flutter_breaking
A simple multi-platform Flutter application for iOS and Android that displays characters from the Breaking Bad universe.
This project was built as a learning-focused demo app to practice Flutter architecture, state management, API integration, and offline handling.

The app fetches characters from a remote API, displays them in a clean UI, and allows users to explore character details with smooth navigation and responsive design.
## Features
    •    View a list of Breaking Bad characters
    •    Search characters by name
    •    View detailed information for each character
    •    Clean and responsive UI design
    •    Offline detection with network state handling
    •    Smooth navigation between screens
    •    Loading indicators and error handling

 ## Technologies Used
    •    Flutter — Cross-platform mobile development framework
    •    Dart — Main programming language
    •    Cubit (Bloc Library) — State management
    •    REST API Integration — Fetching remote character data
    •    flutter_offline — Detecting internet connectivity state
    •    Material Design — UI components and layout
    
    
 ## Architecture

    The app follows a layered architecture to keep code organized and maintainable:
    •    Presentation Layer
    •    Screens
    •    Widgets
    •    UI state handling
    •    Business Logic Layer
    •    Cubit for state management
    •    Handles loading, success, and error states
    •    Data Layer
    •    Repository pattern
    •    Web services for API communication
    •    Model parsing and mapping
    
 ## What I Learned From This App
 
    1.    State Management using Cubit
             •    Learned how to separate UI from business logic.
             •    Managed loading, success, and error states cleanly.
    2.    API Integration & Data Parsing
             •    Worked with JSON responses and converted them into Dart models.
             •    Implemented repository pattern for cleaner data flow.
    3.    Offline Handling
            •    Used flutter_offline to detect connectivity changes.
            •    Improved user experience by reacting to network status.
    4.    Flutter Project Structure
            •    Organized the app into Presentation, Business Logic, and Data layers.
            •    Practiced writing scalable and maintainable Flutter code.
## Installation
   
   1.    Clone the repository:
   
    For HTTPS:
    https://github.com/heshamabdelhamead/flutter_breaking.git
    
    For SSH:
     git@github.com:heshamabdelhamead/flutter_breaking.git
     
  2.    Navigate to the project folder:
        cd flutter_breaking
        
  3.    Install dependencies:
        flutter pub get
        
## Requirements
    •    Flutter 3.x or later
    •    Dart SDK
    •    Android Studio or VS Code with Flutter plugin
    •    iOS Simulator or Android Emulator
    
# Author

Hesham Abdelhamed
Mobile Developer (iOS & Flutter)

UIKit | SwiftUI | SwiftData | Flutter | Cubit | MVVM | VIPER
