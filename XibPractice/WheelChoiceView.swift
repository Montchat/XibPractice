//
//  WheelChoiceCell.swift
//  XibPractice
//
//  Created by Joe Edwards on 1/9/17.
//  Copyright © 2017 HanekeDesign. All rights reserved.
//

import UIKit

class WheelChoiceView: UIView  {
	
	var model:WheelChoiceViewModel = WheelChoiceViewModel()
	
	@IBOutlet var view: UIView!

	@IBOutlet weak var property: UILabel!
	
	@IBOutlet weak var selection: UIButton!
	
	@IBOutlet weak var pickerView: UIPickerView!
	@IBOutlet weak var height: NSLayoutConstraint!
	
	@IBAction func questionPressed(_ sender: Any) {
		print("question pressed")
		
	}
	
	@IBAction func changeSelection(_ sender: Any) {
		let constant:CGFloat
		
		
		
		switch height.constant {
			case 100:
			constant = 0
		default:
			constant = 100
			
		}
		
		view.layoutIfNeeded()
		UIView.animate(withDuration: 0.33) {
			self.height.constant = constant
			self.view.layoutIfNeeded()
			
		}
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		guard let wheelChoiceView = Bundle.main.loadNibNamed(Component.wheelChoiceView, owner: self, options: nil)?[0] as? UIView else {  return }
		
		height.constant = 0
		
		pickerView.delegate = self ; pickerView.dataSource = self
		
		addSubview(wheelChoiceView)
		
	}
	
	func config(with model: WheelChoiceViewModel) {
		self.model = model
		property.text = model.title
		selection.setTitle(model.placeholder, for: .normal)
		pickerView.reloadAllComponents()
		
	}
	
}

extension WheelChoiceView : UIPickerViewDelegate {
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		print("selected")
	}
}

extension WheelChoiceView : UIPickerViewDataSource {
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return model.choices[component].count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return model.choices[component][row]

	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return model.choices.count
	}
	
}

