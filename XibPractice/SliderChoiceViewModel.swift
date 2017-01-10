//
//  SliderChoiceViewModel.swift
//  XibPractice
//
//  Created by Joe Edwards on 1/4/17.
//  Copyright © 2017 HanekeDesign. All rights reserved.
//

import Foundation

class SliderChoiceViewModel {
	
	var question:String = ""
	
	var minValue:String = ""
	var medianValue:String = ""
	var maxValue:String = ""
	
	var level:Int = 0
	
	var update: (Int) -> Void = { _ in }
	
	init() {
		
	}
	
	init(question:String, minValue:String, medianValue:String, maxValue:String) {
		
		self.question = question
		self.minValue = minValue
		self.maxValue = maxValue
		self.medianValue = medianValue
		
	}
	
}
