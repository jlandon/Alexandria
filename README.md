![Alexandria](https://raw.githubusercontent.com/jlandon/Alexandria/assets/logo.png)


# Alexandria

[![Build Status](https://api.travis-ci.org/jlandon/Alexandria.svg)](https://travis-ci.org/jlandon/Alexandria)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Alexandria.svg?style=flat)
![Platform](https://img.shields.io/cocoapods/p/Alexandria.svg?style=flat)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

A library (akin to the [Library of Alexandria](https://en.wikipedia.org/wiki/Library_of_Alexandria)) of Swift extensions to turbocharge your iOS development.

## Requirements

- iOS 8+
- Xcode 8.3+
- Swift 3.1

## Documentation

Documentation is  [available online](https://jlandon.github.io/Alexandria).

> [https://jlandon.github.io/alexandria](https://jlandon.github.io/Alexandria)

## Installation

Pick your poison: [Carthage](https://github.com/carthage/carthage), [CocoaPods](https://github.com/cocoapods/cocoapods), or git submodules.

### Carthage

Add the following to your `Cartfile`.

```ogdl
github "jlandon/Alexandria"
```

Then, run `carthage update`, and add the resulting framework from
`Carthage/Build` into your project's "Linked Frameworks and Libraries" setting
within Xcode.

### CocoaPods

To add Alexandria, add the following to your `Podfile`.

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

Then, run `pod install`.

### Submodules

```bash
$ git submodule add git@github.com:jlandon/Alexandria.git
$ git submodule init
$ git submodule update
```

Then, add the files manually to your Xcode project/workspace.

## Credits

Alexandria is maintained by the team at [Oven Bits](https://ovenbits.com), a software design and development agency based in Dallas, Texas.

## License

Alexandria is released under the MIT license. See LICENSE for details.
