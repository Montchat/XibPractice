//
//  SliderView.swift
//  XibPractice
//
//  Created by Joe Edwards on 1/4/17.
//  Copyright © 2017 HanekeDesign. All rights reserved.
//

import UIKit

class SliderView: UIView {
	
	var model:SliderViewModel = SliderViewModel()
	
	@IBOutlet weak var question: UILabel!
	@IBOutlet weak var level: UILabel!

	@IBOutlet weak var slider: UISlider!
	
	@IBOutlet weak var minValue: UILabel!
	@IBOutlet weak var medianValue: UILabel!
	@IBOutlet weak var maxValue: UILabel!
	
	@IBOutlet var values: [UILabel]! // min == 0, median == 1, max == 2
	
	@IBAction func slide(_ sender: UISlider) {
		let intValue = Int(slider.value)
		level.text = "Level: \(intValue)"
		model.level = Int(intValue)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		slider.maximumValue = 10
		slider.thumbTintColor = UIColor.tapDodgerBlue
		
		slider.maximumTrackTintColor = UIColor.black
		slider.minimumTrackTintColor = UIColor.blue
		
		for value in values { value.textColor = UIColor.tapGunmetal }
		
	}
	
	func config(with model:SliderViewModel) {
		
		self.question.text = model.question
		self.minValue.text = model.minValue
		self.maxValue.text = model.maxValue
		
		if medianValue != nil { self.medianValue.text = model.medianValue }
		else { self.medianValue.alpha = 0 }
		
	}
	
}


class SliderViewModel {
	
	var question:String = ""
	
	var minValue:String = ""
	var medianValue:String = ""
	var maxValue:String = ""
	
	var level:Int = 0
	
	init() {
		
	}
	
	init(with question:String, minValue:String, medianValue:String, maxValue:String) {
		
		self.question = question
		self.minValue = minValue
		self.maxValue = maxValue
		self.medianValue = medianValue
		
	}
	
}
