//
//  SliderView.swift
//  XibPractice
//
//  Created by Joe Edwards on 1/4/17.
//  Copyright © 2017 HanekeDesign. All rights reserved.
//

import UIKit

class SliderView: UIView {
	
	var update: (Int) -> Void = {_ in }
	
	@IBOutlet var view: UIView!
	
	@IBOutlet weak var question: UILabel!
	@IBOutlet weak var level: UILabel!

	@IBOutlet weak var slider: UISlider!
	
	@IBOutlet weak var minValue: UILabel!
	@IBOutlet weak var medianValue: UILabel!
	@IBOutlet weak var maxValue: UILabel!
	
	@IBOutlet var values: [UILabel]! // min == 0, median == 1, max == 2
	
	@IBAction func slide(_ sender: UISlider) {
		update(Int(slider.value))
	
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		guard let sliderView = Bundle.main.loadNibNamed(Component.sliderView, owner: self, options: nil)?[0] as? UIView else { return }
		addSubview(sliderView)
		
	}
	
	override init(frame:CGRect) {
		super.init(frame: frame)
		
		guard let sliderView = Bundle.main.loadNibNamed(Component.sliderView, owner: self, options: nil)?[0] as? UIView else { return }
		
		addSubview(sliderView)
		
	}
	
	func config(with model:SliderChoiceViewModel) {
		self.update = model.update
		
		slider.maximumValue = 10
		slider.thumbTintColor = UIColor.tapDodgerBlue
		
		slider.maximumTrackTintColor = UIColor.tapGunmetal
		slider.minimumTrackTintColor = UIColor.tapDodgerBlue
		
		for value in values { value.textColor = UIColor.tapGunmetal }

		self.question.text = model.question
		self.minValue.text = model.minValue
		self.maxValue.text = model.maxValue
		
		slider.value = Float(model.level)
		level.text = "Level: \(model.level)"
		
		if medianValue != nil { self.medianValue.text = model.medianValue }
			
		else { self.medianValue.alpha = 0 }
		
	}
	
}

