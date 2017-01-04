//
//  ViewController.swift
//  XibPractice
//
//  Created by Joe Edwards on 1/4/17.
//  Copyright © 2017 HanekeDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	
	let testModel = SliderViewModel(with: "test question", minValue: "0", medianValue: "5", maxValue: "10")
	
	@IBOutlet weak var sliderView: SliderView!
	override func viewDidLoad() {
		super.viewDidLoad()
		
		sliderView = Bundle.main.loadNibNamed("Components", owner: self, options:nil)[0] as SliderView
		
//		sliderView.config(with: testModel)
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

