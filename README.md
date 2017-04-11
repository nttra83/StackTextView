# StackTextView
A text view that can dynamically adapt to the content size. All `UIView` can be stacked in the text view to implement the Facebook-like add-post UI.

[![Language Swift 3.1](https://img.shields.io/badge/Language-Swift%203.1-orange.svg?style=flat)](https://swift.org)
[![CocoaPods](https://img.shields.io/cocoapods/v/StackTextView.svg)](#cocoapods)
[![License](https://img.shields.io/github/license/kf99916/StackTextView.svg)](LICENSE)

The following demo is that `UIImageView` and `UIButton` are stacked in the text view.

![StackTextView](/screenshots/stackTextView.gif "StackTextView")

## Requirements

- iOS 8.0 or higher
- Swift 3.0 or higher

## Installation

```ruby
pod "StackTextView"
```

## Usage

### Import

```swift
import StackTextView
```

### StackTextView

The text view that can dynamically adapt to the content size.  
`var arranged​Subviews: [UIView]` the list of views arranged by the stack text view.   
`var spacing: CGFloat` the distance in points between the adjacent edges of the stack view’s arranged views. (default `0.0`) 

#### Functions

```swift
func addArrangedSubview(UIView)
```
Adds a view to the end of the arrangedSubviews array.

```swift
func insertArrangedSubview(UIView, at: Int)
```
Adds the provided view to the array of arranged subviews at the specified index.

```swift
func removeArrangedSubview(UIView)
```
Removes the provided view from the stack’s array of arranged subviews. 

## Apps using StackTextView

If you are using StackTextView in your app and want to be listed here, simply create a pull request or let me know via github. I am always curious who is using my projects :)

[Hikingbook](https://itunes.apple.com/app/id1067838748) - by Zheng-Xiang Ke

![Hikingbook](apps/Hikingbook.png)

## Demo

StackTextViewDemo is a simple demo app which shows the usage of StackTextView.

## Author

Zheng-Xiang Ke, kf99916@gmail.com

## License

StackTextView is available under the MIT license. See the LICENSE file for more info.
