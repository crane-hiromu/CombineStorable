//
//  PublisherTests.swift
//
//
//  Created by h.crane on 2021/04/17.
//

#if canImport(Combine)

import XCTest
import Combine
@testable import CombineStorable

// MARK: - XCTestCase
@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
final class StorableTests: XCTestCase {
    
    // MARK: Class
    
    final class StubObject: NSObject, Storable {
        
        // MARK: Store Method
        
        // case1
        func sinkWithStore(
            value: String,
            receiveCompletion: @escaping (String) -> Void,
            receiveValue: @escaping (String) -> Void
        ) {
            Just<String>(value)
                .sink(receiveCompletion: { result in
                    switch result {
                    case .finished:
                        receiveCompletion("finished")
                    case .failure(_):
                        receiveCompletion("error")
                    }
                }, receiveValue: { value in
                    receiveValue(value)
                })
                .store(in: &self.cancellables)
        }
        
        // case2
        func sinkWithStore(
            value: String,
            receiveValue: @escaping (String) -> Void
        ) {
            Just<String>(value)
                .sink(receiveValue: { value in
                    receiveValue(value)
                })
                .store(in: &self.cancellables)
        }
        
        // case3
        var valueWithStore = 0
        
        func assignWithStore(value: Int) {
            Just<Int>(value)
                .assign(to: \.valueWithStore, on: self)
                .store(in: &self.cancellables)
        }
        
        // MARK: No store Method
        
        // case1
        func sinkWithNoStore(
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
        func sinkWithNoStore(
            value: String,
            receiveValue: @escaping (String) -> Void
        ) {
            Just<String>(value)
                .sink(self, receiveValue: { value in
                    receiveValue(value)
                })
        }
        
        // case3
        var valueWithNoStore = 0
        
        func assignWithNoStore(value: Int) {
            Just<Int>(value)
                .assign(to: \.valueWithNoStore, on: self)
        }
    }
    
    // MARK: Prorperty
    
    static var allTests = [
        ("testSinkWithCompletionAndValueWithStore", testSinkWithCompletionAndValueWithStore),
        ("testSinkWithValueWithStore", testSinkWithValueWithStore),
        ("testAssignWithStore", testAssignWithStore),
        ("testSinkWithCompletionAndValueWithNoStore", testSinkWithCompletionAndValueWithNoStore),
        ("testSinkWithValueWithNoStore", testSinkWithValueWithNoStore),
        ("testAssignWithNoStore", testAssignWithNoStore)
    ]
    
    private let stubObject = StubObject()
    
    // MARK: Test
    
    func testSinkWithCompletionAndValueWithStore() {
        stubObject.sinkWithStore(value: "\(#function)", receiveCompletion: { value in
            XCTAssertEqual(value, "finished")
        }, receiveValue: { value in
            XCTAssertEqual(value, "\(#function)")
            
        })
    }
    
    func testSinkWithValueWithStore() {
        stubObject.sinkWithStore(value: "\(#function)", receiveValue: { value in
            XCTAssertEqual(value, "\(#function)")
        })
    }
    
    func testAssignWithStore() {
        stubObject.assignWithStore(value: 999)
        XCTAssertEqual(stubObject.valueWithStore, 999)
    }
    
    func testSinkWithCompletionAndValueWithNoStore() {
        stubObject.sinkWithNoStore(value: "\(#function)", receiveCompletion: { value in
            XCTAssertEqual(value, "finished")
        }, receiveValue: { value in
            XCTAssertEqual(value, "\(#function)")
            
        })
    }
    
    func testSinkWithValueWithNoStore() {
        stubObject.sinkWithNoStore(value: "\(#function)", receiveValue: { value in
            XCTAssertEqual(value, "\(#function)")
        })
    }
    
    func testAssignWithNoStore() {
        stubObject.assignWithNoStore(value: 9999)
        XCTAssertEqual(stubObject.valueWithNoStore, 9999)
    }
}

#endif
