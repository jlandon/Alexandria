![Alexandria](https://raw.githubusercontent.com/ovenbits/Alexandria/assets/logo.png)


# Alexandria

[![Build Status](https://magnum.travis-ci.com/ovenbits/Alexandria.svg?token=7uGjTDmXCtxxrk7sC9oT)](https://travis-ci.com/ovenbits/Alexandria)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Alexandria.svg?style=flat)
![Platform](https://img.shields.io/cocoapods/p/Alexandria.svg?style=flat)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
[![Twitter](https://img.shields.io/badge/twitter-@OvenBitsMobile-blue.svg?style=social)](http://twitter.com/OvenBitsMobile)

A library of iOS Swift extensions that Oven Bits' iOS developers have found useful, and hopefully you will too.

## Background

As [Oven Bits'](http://ovenbits.com) iOS developers worked on their projects and explored the Swift language, we would find or come up with useful snippets. These snippets weren't enough to create a whole cohesive framework, such as [ModelRocket](https://github.com/ovenbits/ModelRocket), Oven Bits' iOS framework for creating JSON-based models, but the snippets were still useful. So we created a sort of "junk drawer" for all the little things we found useful and reusable.

Alexandria (as in the [Library of Alexandria](https://en.wikipedia.org/wiki/Library_of_Alexandria)) represents the `extension`s of that "junk drawer" of snippets. We find them useful, and hopefully you will too.


## Requirements

- iOS 8+
- Xcode 7.2+
- Swift 2.1


## Documentation

The Alexandria code is extensively documented.

A browsable version of the documentation can be found at [https://ovenbits.github.io/Alexandria](https://ovenbits.github.io/Alexandria)


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

Alexandria is created and maintained by the iOS developer team at [Oven Bits LLC](https://ovenbits.com), a software design and development agency based in Dallas, Texas. We concept and craft delightful solutions across mobile, tablets, desktop, and wearables.

Find us online:

- [Oven Bits Engineering Website](https://engineering.ovenbits.com/)
- [Twitter (@OvenBitsMobile)](https://twitter.com/OvenBitsMobile)


## License

Alexandria is released under the MIT license. See LICENSE for details.
