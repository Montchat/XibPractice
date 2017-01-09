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
	
	let testModel = SliderChoiceViewModel(with: "test question", minValue: "0", medianValue: "5", maxValue: "10")
	
	let wheelChoiceModel = WheelChoiceViewModel(title: "Color", placeholder: "Add color", choices: [["red", "yellow", "blue"]], decimalAfterPosition: nil)
	
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self ; tableView.dataSource = self
		tableView.tableFooterView = UIView() 
		
		sliderView.config(with: testModel)
		
	}
	
}


extension ViewController : UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
	
}

extension ViewController : UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = WheelChoiceCell()
		cell.config(with: wheelChoiceModel)
		return cell
		
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
}

