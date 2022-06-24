//
//  Version.swift
//  Version
//

import Foundation

public struct Version {
	public let major: UInt
	public let minor: UInt
	public let patch: UInt

	public init(_ major: UInt = 0, _ minor: UInt = 0, _ patch: UInt = 0) {
		self.major = major
		self.minor = minor
		self.patch = patch
	}
}

extension Version: Equatable {}

extension Version: Comparable {
	public static func < (lhs: Version, rhs: Version) -> Bool {
		guard lhs.major == rhs.major else {
			return lhs.major < rhs.major
		}
		guard lhs.minor == rhs.minor else {
			return lhs.minor < rhs.minor
		}
		return lhs.patch < rhs.patch
	}
}

extension Version: LosslessStringConvertible {
	public init?(_ description: String) {
		let parts = description.split(separator: ".")
		guard parts.count >= 1 && parts.count <= 3 else { return nil }

		var iter = parts.makeIterator()
		func parse() -> UInt? {
			if let component = iter.next() {
				// Returns nil if the String to UInt converion failed
				return UInt(component)
			} else {
				// Return 0 if components weren't specified
				return 0
			}
		}

		guard let major = parse() else { return nil }
		self.major = major
		guard let minor = parse() else { return nil }
		self.minor = minor
		guard let patch = parse() else { return nil }
		self.patch = patch
	}

	public var description: String {
		return "\(self.major).\(self.minor).\(self.patch)"
	}
}

extension Version: ExpressibleByStringLiteral {
	public init(stringLiteral value: StaticString) {
		guard let version = Version(value.description) else {
			preconditionFailure("Failed to parse a Version from the literal '\(value)'")
		}
		self = version
	}
}

extension Version {
	public static func current() -> Version {
		Bundle.main.version!
	}
}
