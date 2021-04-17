//
//  Publisher+Storable.swift
//
//
//  Created by h.crane on 2021/04/17.
//

#if canImport(Combine)

import Foundation
import Combine

// MARK: - Publisher Extension
@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Publisher {
    
    func sink<T: Storable>(
        _ target: T,
        receiveCompletion: @escaping ((Subscribers.Completion<Self.Failure>) -> Void),
        receiveValue: @escaping ((Self.Output) -> Void)
    ) {
        sink(receiveCompletion: receiveCompletion, receiveValue: receiveValue)
            .store(in: &target.cancellables)
    }
}

// MARK: - Publisher Extension (Never)
@available(iOS 13.0, OSX 10.15, *)
public extension Publisher where Self.Failure == Never {
    
    func sink<T: Storable>(
        _ target: T,
        receiveValue: @escaping ((Self.Output) -> Void)
    ) {
        sink(receiveValue: receiveValue)
            .store(in: &target.cancellables)
    }
    
    func assign<O: Storable>(
        to keyPath: ReferenceWritableKeyPath<O, Self.Output>,
        on object: O
    ) {
        assign(to: keyPath, on: object)
            .store(in: &object.cancellables)
    }
}

#endif
