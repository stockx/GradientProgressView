![Gradient Progress View Logo](https://cloud.githubusercontent.com/assets/879038/21463490/eac0e8dc-c937-11e6-914c-bd95fd7d289d.png)

![Swift3](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat")
[![Platform](https://img.shields.io/cocoapods/p/BubbleRankingIndicator.svg?style=flat)](http://cocoapods.org/pods/BubbleRankingIndicator)
[![Version](https://img.shields.io/cocoapods/v/BubbleRankingIndicator.svg?style=flat)](http://cocoapods.org/pods/BubbleRankingIndicator)
[![License](https://img.shields.io/cocoapods/l/BubbleRankingIndicator.svg?style=flat)](http://cocoapods.org/pods/BubbleRankingIndicator)

Description
--------------

`GradientProgressView` is a simple drop-in progress view with a slight linear vertical gradient.

![Example 1](https://cloud.githubusercontent.com/assets/879038/19249360/2725f6c4-8f03-11e6-8c64-9c07fed66ae5.png)

# Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)
- [Contact](#contact)

## Features
- [x] Supports AutoLayout.
- [x] Supports customizing background colors.
- [x] Supports being created either in code or a Storyboard.

## Installation

### CocoaPods

... once this is on Cocoapods...

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate `GradientProgressView` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'GradientProgressView'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

`GradientProgressView` is state based. To configure the progress view, simply update the `state` value with whatever values you'd like, and re-set the state:

1) First you should set up the `GradientProgressView`:

```swift
var gradientProgressView = GradientProgressView(frame: .zero)

var state = gradientProgresssView.state
state.progressColor = .blue
state.backgrtoundColor = .white
state.borderColor = .lightGray

gradientProgressView.state = state
```

2) In order to set the progress, modify the state:

```swift
var state = gradientProgressView.state

state.progress = 0.5

gradientProgressView.state = state
```

## License

`GradientProgressView` is developed by [Josh Sklar](https://www.linkedin.com/in/jrmsklar) at [StockX](https://stockx.com) and is released under the MIT license. See the `LICENSE` file for details.

## Contact

You can follow or drop me a line on [my Twitter account](https://twitter.com/jrmsklar). If you find any issues on the project, you can open a ticket. Pull requests are also welcome.
