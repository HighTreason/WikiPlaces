# WikiPlaces

A small SwiftUI app that loads location data from a remote JSON file and displays them in a list. 
When a location is tapped, the app opens the Wikipedia app with the map focused on the given coordinates.

## Features

- Loads data from:  
  [https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json](https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json)
- Displays locations in a styled list
- Tapping a location opens its Wikipedia page via the Wikipedia app (or browser fallback)

## Requirements

- Swift Concurrency (async/await)
- SwiftTesting

## Accessibility

- All UI elements are voiceover-friendly
- Supports dynamic type and basic accessibility labels

## How to Run

1. Clone the repository
2. Open `WikiPlaces.xcodeproj` in Xcode
3. Build and run on a simulator or device

## License

None
