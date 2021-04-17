//
//  Storable.swift
//
//
//  Created by h.crane on 2021/04/17.
//

#if canImport(Combine)

import Foundation
import Combine

// MARK: - Protocol
@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public protocol Storable: NSObject {
    var cancellables: Set<AnyCancellable> { get set }
}

#endif
