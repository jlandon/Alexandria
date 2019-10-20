![Alexandria](https://raw.githubusercontent.com/jlandon/Alexandria/master/alexandria.png)


# Alexandria

[![SwiftPM Compatible](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Alexandria.svg)
![Platform](https://img.shields.io/cocoapods/p/Alexandria.svg)
![Swift Support](https://img.shields.io/badge/Swift-5.0%2C%205.1-orange.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

A library (akin to the [Library of Alexandria](https://en.wikipedia.org/wiki/Library_of_Alexandria)) of Swift extensions to turbocharge your iOS development.

## Requirements

- iOS 8+
- Xcode 11+
- Swift 5.0/5.1

## Documentation

Documentation is  [available online](https://jlandon.github.io/Alexandria).

> [https://jlandon.github.io/alexandria](https://jlandon.github.io/Alexandria)

## Installation

### Swift Package Manager with Xcode 11

[Adding Package Dependencies to Your App](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app)

### Carthage

```ogdl
github "jlandon/Alexandria"
```

### CocoaPods

```ruby
use_frameworks!
pod 'Alexandria'
```

Alternativly, you can install specific components:

```ruby
pod 'Alexandria/Core'
pod 'Alexandria/StoreKit'
pod 'Alexandria/ImageEffects'
```

### Submodules

```bash
$ git submodule add git@github.com:jlandon/Alexandria.git
$ git submodule init
$ git submodule update
```

Then, add the files manually to your Xcode project/workspace.

## License

Alexandria is released under the MIT license. See LICENSE for details.
