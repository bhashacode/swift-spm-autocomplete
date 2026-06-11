# Release Notes

## SwiftPM-only migration

- Removed CocoaPods packaging support.
- Added first-class Swift Package Manager support through a root `Package.swift` manifest.
- Moved library sources and Interface Builder resources under `Sources/CCAutocomplete`.
- Declared SwiftPM platform support as `.iOS(.v15)` because SwiftPM cannot express iOS 15.6 exactly.
- Intended minimum runtime for this fork is iOS 15.6.
