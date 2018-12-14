//
//  TestTests.swift
//  TestTests
//
//  Created by Trevin Wisaksana on 14/12/18.
//  Copyright © 2018 Trevin Wisaksana. All rights reserved.
//

import XCTest
@testable import Test

class TestTests: XCTestCase {
    
    var dataSource: DataSource?

    override func setUp() {
        dataSource = DataSource()
        dataSource?.loadData()
    }

    override func tearDown() {
        
    }

    func testSuccessfulPagination() {
        dataSource?.paginate(currentIndex: 10)
        XCTAssertEqual(20, dataSource?.numberOfItems)
    }
    
    func testFailingPagination() {
        dataSource?.paginate(currentIndex: 10)
        XCTAssertNotEqual(5, dataSource?.numberOfItems)
    }

}
