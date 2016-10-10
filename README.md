# GradientProgressView

Simple drop-in progress view with a slight linear vertical gradient.

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Credits](#credits)
- [License](#license)
- [Examples](#examples)

## Installation

### CocoaPods

... once this is on Cocoapods...

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate GradientProgressView into your Xcode project using CocoaPods, specify it in your `Podfile`:

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

`GradientProgressView` is state based. To configure the progress view, simply update the `state` value with whatever values you'd like, and re-set the graidntView's state:

```swift
var state = gradientProgressView.state
state.progress = 0.5
gradientProgressView.state = state
```

In the above example, the gradientProgressView's state is updated with a new progress value. When the state is set on the gradientProgressView in the third line, the view will update and reflect its new state.

## Examples

![Example 1](https://cloud.githubusercontent.com/assets/879038/19249360/2725f6c4-8f03-11e6-8c64-9c07fed66ae5.png)
