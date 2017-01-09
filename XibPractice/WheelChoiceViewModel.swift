//
//  WheelChoiceViewModel.swift
//  thyroid-3D-ios
//
//  Created by Daniel Tartaglia on 1/4/17.
//  Copyright © 2017 haneke. All rights reserved.
//

import Foundation


class WheelChoiceViewModel {
	
	var title: String = ""
	var indexes: [Int] = []
	var choices: [[String]] = []
	var decimalAfterPosition: Int? = nil
	var update: ([Int]) -> Void = { _ in }
	var choice: String {
		var result = ""
		for (i, index) in indexes.enumerated() {
			let element = choices[i][index]
			if let decimal = decimalAfterPosition, i == decimal {
				result.append("\(element).")
			}
			else {
				result.append("\(element) ")
			}
		}
		return String(result.characters.dropLast())
	}

	init(title: String, choices: [[String]], decimalAfterPosition: Int? = nil) {
		self.title = title
		self.choices = choices
		self.decimalAfterPosition = decimalAfterPosition
	}
}
