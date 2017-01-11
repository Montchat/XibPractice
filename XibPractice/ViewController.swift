//
//  ViewController.swift
//  XibPractice
//
//  Created by Joe Edwards on 1/4/17.
//  Copyright © 2017 HanekeDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var sliderView: SliderView!
	
	@IBOutlet weak var wheelChoiceView: WheelChoiceView!
	
	@IBOutlet weak var multiChoiceView: MultiChoiceView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let sliderChoiceViewModel = SliderChoiceViewModel(question: "test question", minValue: "0", medianValue: "5", maxValue: "10")
		
		let wheelChoiceModel = WheelChoiceViewModel(title: "Color", placeholder: "combine color", choices: [["red", "yellow", "blue"], ["green", "pink", "brown"]], decimalAfterPosition: nil)
		
		let multiChoiceModel = MultiChoiceViewModel(with: "Are you hungry?" , index: 0, choices: ["yes" , "no" ])

		sliderChoiceViewModel.update = { level in
			sliderChoiceViewModel.level = level
			self.sliderView.config(with: sliderChoiceViewModel)
			
		}
		
		wheelChoiceModel.update = { indexes in
			wheelChoiceModel.indexes = indexes
			self.wheelChoiceView.config(with: wheelChoiceModel)
		}
		
		multiChoiceModel.update = { index in
			
			multiChoiceModel.index = index
			self.multiChoiceView.config(with: multiChoiceModel)
			
		}
		
		sliderView.config(with: sliderChoiceViewModel)
		wheelChoiceView.config(with: wheelChoiceModel)
		multiChoiceView.config(with: multiChoiceModel)
		
	}
	
}
