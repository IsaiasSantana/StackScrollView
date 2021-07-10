# StackScrollView
A simple Scrollable UIStackView with ScrollView

## Usage

```swift
let stack = StackScrollView()
```

### Add your custom view

```swift
stackScrollView.add(view: buildCustomUIView())
```

### Remove your custom view

```swift
customView.removeFromSuperview()
```

## Custom methods

```swift
func add(view: UIView)
func add(views: [UIView])
```
