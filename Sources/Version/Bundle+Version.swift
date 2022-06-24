//
//  Bundle+Version.swift
//  Version
//

import Foundation

extension Bundle {
	public var versionString: String? {
		self.infoDictionary?["CFBundleShortVersionString"] as? String
	}

	public var version: Version? {
		guard let string = self.versionString else { return nil }
		return Version(string)
	}
}
