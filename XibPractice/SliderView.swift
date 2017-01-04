//
//  SliderView.swift
//  XibPractice
//
//  Created by Joe Edwards on 1/4/17.
//  Copyright © 2017 HanekeDesign. All rights reserved.
//

import UIKit

class SliderView: UIView {
	
	@IBOutlet weak var question: UILabel!
	@IBOutlet weak var level: UILabel!

	@IBOutlet weak var slider: UISlider!
	
	@IBOutlet weak var minValue: UILabel!
	@IBOutlet weak var medianValue: UILabel!
	@IBOutlet weak var maxValue: UILabel!
	
	@IBOutlet var values: [UILabel]! // min == 0, median == 1, max == 2
	
	@IBAction func slide(_ sender: UISlider) {
		level.text = "Level: \(slider.value)" 
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		slider.maximumValue = 10
		slider.thumbTintColor = UIColor.tapDodgerBlue
		
		slider.maximumTrackTintColor = UIColor.black
		slider.minimumTrackTintColor = UIColor.blue
		
		for value in values { value.textColor = UIColor.tapGunmetal }
		
	}
	
	func config(with question:String, minValue:String, medianValue:String?, maxValue:String) {
		
		self.question.text = question
		self.minValue.text = minValue
		self.maxValue.text = maxValue
		
		if medianValue != nil { self.medianValue.text = medianValue }
		else { self.medianValue.alpha = 0 }
		
	}

}
