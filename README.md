# iOS Textfield Autocomplete

This is an iOS autocomplete component for `UITextField`, written in Swift.

![Autocomplete Demo](http://i.imgur.com/y8TfMEs.gif)

## Installation

### Swift Package Manager

In Xcode:

1. Open your project.
2. Go to File > Add Package Dependencies.
3. Enter this repository URL.
4. Select the required version, branch, or commit.
5. Add the `CCAutocomplete` package product to your app target.

Minimum supported iOS version: 15.6.

> Note: SwiftPM package manifests cannot express iOS 15.6 exactly, so `Package.swift` declares `.iOS(.v15)` while this fork documents and supports iOS 15.6 as the intended minimum runtime.

If this fork has not published a release tag yet, install it from the maintained branch or a pinned commit.

## Usage

Import the package product in any Swift file that uses the library:

```swift
import CCAutocomplete
```

### AutocompleteDelegate

The view controller containing the `UITextField` should conform to the `AutocompleteDelegate` protocol.
The protocol contains the following methods:

#### Required methods

1. `func autoCompleteTextField() -> UITextField`: Returns the `UITextField` to apply autocomplete to.
2. `func autoCompleteThreshold(textField: UITextField) -> Int`: Returns the minimum number of characters required before showing autocomplete.
3. `func autoCompleteItemsForSearchTerm(term: String) -> [AutocompletableOption]`: Returns objects that conform to `AutocompletableOption` for the autocomplete list.
4. `func autoCompleteHeight() -> CGFloat`: Returns the maximum autocomplete list height.
5. `func didSelectItem(item: AutocompletableOption) -> Void`: Called when the user taps an autocomplete item.

#### Optional methods

1. `func nibForAutoCompleteCell() -> UINib`: Create a nib file containing a custom `UITableViewCell` and return it from this method to customize autocomplete cells.
2. `func heightForCells() -> CGFloat`: Returns the height of autocomplete cells.
3. `func maxHeightForController() -> CGFloat?`: Returns an optional maximum height for the autocomplete controller.
4. `func getCellDataAssigner() -> ((UITableViewCell, AutocompletableOption) -> Void)`: Returns a closure that assigns an `AutocompletableOption` to a `UITableViewCell` subclass.

### AutocompletableOption

`AutocompletableOption` is the protocol used for the autocomplete table view data source.
Create an object that conforms to this protocol when you need custom data in autocomplete cells.

### TODOs

There is a plan to add support for multiple sections in autocomplete results.
