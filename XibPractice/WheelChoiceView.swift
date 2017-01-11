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
		updateConstraint()
		
	}
	
	func cancel() {
		updateConstraint()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		guard let wheelChoiceView = Bundle.main.loadNibNamed(Component.wheelChoiceView, owner: self, options: nil)?[0] as? UIView else { return }
		
		let startFrame = CGRect(x: 0, y: pickerView.bounds.minY, width: pickerView.frame.width, height: 40)
		
		let headerBar = UIView(frame:startFrame)
		headerBar.layer.borderWidth = 0.50
		headerBar.layer.masksToBounds = true
		
		let cancelButton = UIButton(frame: CGRect(x: 7, y: headerBar.frame.origin.y + 13.4, width: 48, height: 18))
		cancelButton.setTitle("Cancel", for: .normal)
		cancelButton.setTitleColor(UIColor.blue, for: .normal)
		cancelButton.addTarget(self, action:"cancel" ,for: .touchUpInside)
		
		let addButton = UIButton(frame: CGRect(x:headerBar.frame.maxX - 38 - 7, y: headerBar.frame.origin.y + 13.4, width: 38, height: 18))
		addButton.setTitle("Ok", for: .normal)
		addButton.setTitleColor(UIColor.blue, for: .normal)
		
		headerBar.addSubview(cancelButton)
		headerBar.addSubview(addButton)
		
		headerBar.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
		
		height.constant = 0
		
		pickerView.delegate = self ; pickerView.dataSource = self
		pickerView.backgroundColor = UIColor.red
		pickerView.addSubview(headerBar)
		
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

