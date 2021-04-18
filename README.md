# Storable

<img width="1000" alt="image" src="https://user-images.githubusercontent.com/24838521/115123515-557ea100-9ff8-11eb-8533-a6d3ddfdca9c.png">


## Description

If you're using Combine, you've probably encountered the following code more than a few times.

```swift
class Object: NSObject {
    var cancellables = Set<AnyCancellable>()

    ...
}
```

Instead of adding a new property to every object, use this library to add it for you, to any subclass of NSObject.

### Example1

```swift
final class Object: NSObject, Storable { // import Storable

    // You don't have to write this.
    // private var cancellables = Set<AnyCancellable>()

    func exec() {
        Just<Int>(0)
            .sink(receiveCompletion: { _ in
                // do something
            }, receiveValue: { _ in 
                // do something
            })
            .store(in: &self.cancellables) // read Set<AnyCancellable> in yourself.
    }
}
```

You can read ``Set<AnyCancellable>`` without member variable. It'll work just like a property: when the instance is deinit'd, the ``Set<AnyCancellable>`` gets disposed. It's also a readwrite property, so you can use your own, too.

<br>

Furthermore, ``.store(in: &self.cancellables)`` can be omitted.

### Example2


```swift
final class Object: NSObject, Storable {

    func exec() {
        Just<Int>(0)
            .sink(self, receiveCompletion: { _ in // input self
                // do something
            }, receiveValue: { _ in 
                // do something
            })
    }
}
```

For a detailed explanation, please read [here](https://qiita.com/hcrane/items/c9ae8427a5c6d8fc08ee).


## Installing

### CocoaPods

Add the following line to your Podfile:

```
pod 'CombineStorable', :git => 'git@github.com:crane-hiromu/CombineStorable.git', :branch => 'main'
```

### Carthage

Add the following to your Cartfile:

```
github "crane-hiromu/CombineStorable"
```

### Swift Package Manager

Add the following dependency to your Package.swift file:

```
.package(url: "https://github.com/crane-hiromu/CombineStorable.git", from: "1.0.0")
```

### License

MIT, of course ;-) See the LICENSE file.
