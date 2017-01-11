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
	
	@IBOutlet weak var toolBar: UIToolbar!
	
	@IBAction func questionPressed(_ sender: Any) {
		print("question pressed")
		
	}
	
	@IBAction func changeSelection(_ sender: Any) {
		updateConstraint()
		
	}
	
	@IBAction func cancel(_ sender: Any) {
		updateConstraint()
		
	}
	
	
	@IBAction func donePressed(_ sender: Any) {
		updateConstraint()
		
		let selection = pickerView.selectedRow(inComponent: 0).description
		self.selection.setTitle(selection, for: .normal)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		guard let wheelChoiceView = Bundle.main.loadNibNamed(Component.wheelChoiceView, owner: self, options: nil)?[0] as? UIView else { return }
		
		height.constant = 0
		toolBar.alpha = 0 ; pickerView.alpha = 0
		
		pickerView.delegate = self ; pickerView.dataSource = self
		
		addSubview(wheelChoiceView)

	}
	
	func config(with model: WheelChoiceViewModel) {
		
		self.model = model
		property.text = model.title
		selection.setTitle(model.placeholder, for: .normal)
		pickerView.reloadAllComponents()
		
	}
	
	func updateConstraint() {
		let constant:CGFloat
		let alpha:CGFloat
		
		switch height.constant {
		case 200:
			constant = 0
			alpha = 0
		default:
			constant = 200
			alpha = 1
			
		}
		
		view.layoutIfNeeded()
		
		UIView.animate(withDuration: 0.33) {
			self.height.constant = constant
			self.toolBar.alpha = alpha
			self.pickerView.alpha = alpha
			
			self.view.layoutIfNeeded()
			
		}
		
	}
	
}

extension WheelChoiceView : UIPickerViewDelegate {
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		
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

