![Alexandria](https://raw.githubusercontent.com/ovenbits/Alexandria/assets/logo.png)


# Alexandria

[![Build Status](https://api.travis-ci.org/ovenbits/Alexandria.svg)](https://travis-ci.org/ovenbits/Alexandria)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Alexandria.svg?style=flat)
![Platform](https://img.shields.io/cocoapods/p/Alexandria.svg?style=flat)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
[![Twitter](https://img.shields.io/badge/twitter-@OvenBitsMobile-blue.svg?style=social)](http://twitter.com/OvenBitsMobile)

A library of Swift extensions to turbocharge your iOS development.

## Background

Here at [Oven Bits](http://ovenbits.com), we love Swift. We started using it when it was first released in 2014, and have been building large portions (or all) of our iOS applications in it since then.

One of our favorite features in Swift is [extensions](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Extensions.html), and we've been using them heavily to add conveniences to UIKit & Foundation, and help "make it our own".

_Alexandria_ (as in the [Library of Alexandria](https://en.wikipedia.org/wiki/Library_of_Alexandria)) is the result of that work. We use it as our "standard library" when starting iOS applications, and find it greatly speeds up our development time, and helps us get our applications off the ground quicker. Hopefully you will too!

## Requirements

- iOS 8+
- Xcode 7.3+
- Swift 2.2


## Documentation

Documentation is  [available online](https://ovenbits.github.io/Alexandria).

> [https://ovenbits.github.io/alexandria](https://ovenbits.github.io/Alexandria)

## Installation

Pick your poison: [Carthage](https://github.com/carthage/carthage), [CocoaPods](https://github.com/cocoapods/cocoapods), or git submodules.

### Carthage

Add the following to your `Cartfile`.

```ogdl
github "ovenbits/Alexandria"
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
$ git submodule add git@github.com:ovenbits/Alexandria.git
$ git submodule init
$ git submodule update
```

Then, add the files manually to your Xcode project/workspace.

## Credits

Alexandria is maintained by the team at [Oven Bits](https://ovenbits.com), a software design and development agency based in Dallas, Texas.

> P.S. [We're hiring!](http://ovenbits.com/jobs).

Find us online:

- [Twitter (@OvenBitsMobile)](https://twitter.com/OvenBitsMobile)

<img alt="Baked with love by Oven Bits, a software design and development agency based in Dallas, Texas." width="150" height="150" src="https://cloud.githubusercontent.com/assets/896486/13259258/3cb10ac0-da1c-11e5-9db8-828357f5a2b3.png" />


## License

Alexandria is released under the MIT license. See LICENSE for details.
