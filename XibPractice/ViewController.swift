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
	
	let testModel = SliderChoiceViewModel(question: "test question", minValue: "0", medianValue: "5", maxValue: "10")
	let wheelChoiceModel = WheelChoiceViewModel(title: "Color", placeholder: "Add color", choices: [["red", "yellow", "blue"]], decimalAfterPosition: nil)
	let multiChoiceModel = MultiChoiceViewModel(with: "Are you hungry?" , index: nil, choices: ["yes" , "no" ])
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		sliderView.config(with: testModel)
		wheelChoiceView.config(with: wheelChoiceModel)
		multiChoiceView.config(with: multiChoiceModel)
		
	}
	
}
