//
//  ViewController.swift
//  XibPractice
//
//  Created by Joe Edwards on 1/4/17.
//  Copyright © 2017 HanekeDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let testModel = SliderChoiceViewModel(with: "test question", minValue: "0", medianValue: "5", maxValue: "10")
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let sliderView = SliderView.create()
		
		sliderView.config(with: testModel)
		view.addSubview(sliderView)
	}

	
}
