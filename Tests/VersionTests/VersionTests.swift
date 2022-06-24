//
//  VersionTests.swift
//  VersionTests
//

import XCTest
@testable import Version

final class VersionTests: XCTestCase {
	func testEquatable() {
		XCTAssertEqual(Version(1, 0, 0), Version(1))
		XCTAssertEqual(Version(1, 0, 0), Version(1, 0))
		XCTAssertEqual(Version(1, 0, 0), Version(1, 0, 0))
		XCTAssertEqual(Version(1, 0, 0), Version("1"))
		XCTAssertEqual(Version(1, 0, 0), Version("1.0"))
		XCTAssertEqual(Version(1, 0, 0), Version("1.0.0"))
	}

	func testComparable() {
		XCTAssertLessThan(Version("1"), Version(2))
		XCTAssertLessThan(Version("1"), Version(1, 1))
		XCTAssertLessThan(Version("1"), Version(1, 0, 1))
	}
}
