//
//  ViewModelTests.swift
//  SamplesAppTests
//
//  Created by Renjun Li on 2022/11/27.
//

import Foundation
import XCTest

@testable
import SamplesApp

final class ViewModelTests: XCTestCase {
    func testIsTrue() {
        let sut = ViewModel()
        XCTAssertTrue(sut.isTrue())
    }
}
