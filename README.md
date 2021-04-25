# UserAPP

UserApp is a sample application designed under the given requirements of needzaio

## Installation

Use the package manager included in [flutter](https://flutter.dev/docs/get-started/install) to install UserApp.

```bash
flutter pub get
```

Run the application in a connected Android or Ios device using :
```bash
flutter run
```

## Project Structure
```bash
├── assets                  # All the assets used in the project
│   ├── images              
│   ├── fonts               
│   └── icons               # A copy of every icon used in the app
├── lib                     # Source files 
│   ├── routes              # Routing management with the autoroute package
│   ├── screens             # The different views that make up the app
│   ├── service             # Server connection services used by different parts of the app
│   ├── values              # Sets of constants
│   └── widgets             # Custom UI elements
```

## Clarifications
 * As no structure was provided a custom project structure was used.
 * The icons inside the assets folder are just a copy of the icons used, those are inside the NeedZaioIcons font and the 
need_zaio_icons.dart file
 * The routing was managed using auto-route-generation
 * No screen was disabled during the transitions for showcase purposes.
