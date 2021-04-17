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

// MARK: - NSObject Extension
@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension NSObject {

    var cancellables: Set<AnyCancellable> {
        get {
            if let cancellables = objc_getAssociatedObject(self, &cancellableContext) as? Set<AnyCancellable> {
                return cancellables
            }
            let cancellables = Set<AnyCancellable>()
            objc_setAssociatedObject(self, &cancellableContext, cancellables, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return cancellables
        }
        set {
            objc_setAssociatedObject(self, &cancellableContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

#endif
