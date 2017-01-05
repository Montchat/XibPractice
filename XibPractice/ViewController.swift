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
	
	@IBOutlet weak var sliderView: SliderView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		sliderView = Bundle.main.loadNibNamed(Component.sliderView, owner: self, options:nil)?[0] as! SliderView
		view.addSubview(sliderView)
		
		sliderView.config(with: testModel)
	}

}

