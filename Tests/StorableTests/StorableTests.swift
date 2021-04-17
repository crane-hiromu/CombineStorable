//
//  PublisherTests.swift
//
//
//  Created by h.crane on 2021/04/17.
//

#if canImport(Combine)

import XCTest
import Combine
@testable import Storable

// MARK: - XCTestCase
@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
final class StorableTests: XCTestCase {
    
    // MARK: Class
    
    final class StubObject: NSObject, Storable {
        
        // case1
        func sink(
            value: String,
            receiveCompletion: @escaping (String) -> Void,
            receiveValue: @escaping (String) -> Void
        ) {
            Just<String>(value)
                .sink(self, receiveCompletion: { result in
                    switch result {
                    case .finished:
                        receiveCompletion("finished")
                    case .failure(_):
                        receiveCompletion("error")
                    }
                }, receiveValue: { value in
                    receiveValue(value)
                })
        }
        
        // case2
        func sink(
            value: String,
            receiveValue: @escaping (String) -> Void
        ) {
            Just<String>(value)
                .sink(self, receiveValue: { value in
                    receiveValue(value)
                })
        }
        
        // case3
        var value = 0
        
        func assign(value: Int) {
            Just<Int>(value)
                .assign(to: \.value, on: self)
        }
    }
    
    // MARK: Prorperty
    
    static var allTests = [
        ("testSinkWithCompletionAndValue", testSinkWithCompletionAndValue),
        ("testSinkWithValue", testSinkWithValue),
        ("testAssign", testAssign),
    ]
    
    private let stubObject = StubObject()
    
    // MARK: Test
    
    
    func testSinkWithCompletionAndValue() {
        stubObject.sink(value: "\(#function)", receiveCompletion: { value in
            XCTAssertEqual(value, "finished")
        }, receiveValue: { value in
            XCTAssertEqual(value, "\(#function)")
            
        })
    }
    
    func testSinkWithValue() {
        stubObject.sink(value: "\(#function)", receiveValue: { value in
            XCTAssertEqual(value, "\(#function)")
        })
    }
    
    func testAssign() {
        stubObject.assign(value: 999)
        XCTAssertEqual(stubObject.value, 999)
    }
}

#endif
