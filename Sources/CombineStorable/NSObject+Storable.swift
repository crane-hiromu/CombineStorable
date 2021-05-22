//
//  NSObject+Storable.swift
//
//
//  Created by h.crane on 2021/04/17.
//

#if canImport(Combine)

import Foundation
import Combine

// MARK: - Private Property
private var cancellableContext: UInt8 = 0

// MARK: - Private Wrapper Class
@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
private class CancellableWrapper {
    let cancellables: Set<AnyCancellable>
    
    init(cancellables: Set<AnyCancellable>) {
        self.cancellables = cancellables
    }
}

// MARK: - NSObject Extension
@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension NSObject {

    var cancellables: Set<AnyCancellable> {
        get {
            if let wrapper = objc_getAssociatedObject(self, &cancellableContext) as? CancellableWrapper {
                return wrapper.cancellables
            }
            let cancellables = Set<AnyCancellable>()
            self.cancellables = cancellables
            return cancellables
        }
        set {
            let wrapper = CancellableWrapper(cancellables: newValue)
            objc_setAssociatedObject(self, &cancellableContext, wrapper, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

#endif
