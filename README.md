# myEsim

- At myEsim, we're redefining the way you stay connected while traveling abroad. Say goodbye to the inconvenience of traditional SIM cards.[Live Demo](https://apps.apple.com/pk/app/myesim/id6480527568)
---

### Table of Contents

1. [Project Features](#projectfeatures)
2. [Requirements](#requirements)
3. [Installation Guide](#installation)
4. [Project Structure](#projectstructure)

---

### Project Features
- myEsim comprised of following features
    - FirebaseAuth
    - QR generation and Scanning
    - Flutter Stripe
    - In-App Vouchers
    - Counry Flags Api
    - NodeMailer

### Requirements
- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK (included with Flutter)
- Android Studio or Visual Studio Code for development
- Android/iOS emulator or a physical device for testing

### Installation Guide

**Steps:**
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/myEsim.git

2. Navigate into the project directory:
   ```bash
   cd myEsim

3. Get dependencies:
   ```bash
   flutter pub get

4. Run the app:
   ```bash
   flutter run

### Project Structure

myEsim/
├── lib/
│   ├── main.dart                     # Entry point of the application  
│   ├── globals.dart                  # Global variables and constants  
│   ├── firebase_options.dart         # Firebase configuration  
│   ├── components/                   # Reusable UI components  
│   │   ├── dashboard.dart            # Dashboard UI  
│   │   ├── drawer.dart               # Navigation drawer UI  
│   │   ├── marquee_widget.dart       # Marquee text widget  
│   │   ├── payment_method.dart       # Payment method UI  
│   ├── src/                          # Core application logic  
│   │   ├── auth/                     # Authentication-related code  
│   │   ├── mainpage/                 # Main application page  
│   │   ├── plans/                    # Plans management  
│   │   ├── profiles/                 # User profiles  
│   │   ├── qrscreens/                # QR code scanning and generation  
│   │   ├── vouchers/                 # Vouchers management  

