# Storable

## Description

If you're using Combine, you've probably encountered the following code more than a few times.

```swift
class Object: NSObject {
    var cancellables = Set<AnyCancellable>()

    ...
}
```

Instead of adding a new property to every object, use this library to add it for you, to any subclass of NSObject.

### Example

```swift
final class Object: NSObject, Storable {

    // You don't have to write this.
    // private var cancellables = Set<AnyCancellable>()

    func exec() {
        Just<Int>(0)
            .sink(receiveCompletion: { _ in
                // do something
            }, receiveValue: { _ in 
                // do something
            })
            .store(in: &self.cancellables) // 
    }
}
```

## Installing

### CocoaPods

Add the following line to your Podfile:

```
pod 'Storable'
```

### Carthage

Add the following to your Cartfile:

```
github "crane-hiromu/Storable"
```

### Swift Package Manager

Add the following dependency to your Package.swift file:

```
.package(url: "https://github.com/crane-hiromu/Storable.git", from: "1.0.0")
```

### Example

### License

MIT, of course ;-) See the LICENSE file.
