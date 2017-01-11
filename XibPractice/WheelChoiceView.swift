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
	
	@IBOutlet weak var textField: UITextField!
	
	@IBAction func questionPressed(_ sender: Any) {
		print("question pressed")
		
	}
		
	func cancel() {
		textField.resignFirstResponder()
	}
	
	func done() {
		textField.resignFirstResponder()
		
	}
	
	@IBAction func addOrRemove(_ sender: Any) {
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		guard let wheelChoiceView = Bundle.main.loadNibNamed(Component.wheelChoiceView, owner: self, options: nil)?[0] as? UIView else { return }
		
		textField.delegate = self
		
		let pickerView = UIPickerView()
		pickerView.delegate = self ; pickerView.dataSource = self
		
		let headerBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: pickerView.frame.width, height: 44))
		headerBar.autoresizingMask = [.flexibleWidth ]
			
		headerBar.layer.borderWidth = 0.50
		headerBar.layer.masksToBounds = true
		
		headerBar.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
		
		let cancelButton = UIButton(frame: CGRect(x: 0, y: headerBar.frame.origin.y + 13.4, width: 48, height: 18))
		cancelButton.setTitle("Cancel", for: .normal)
		cancelButton.setTitleColor(UIColor.tapBrightBlue, for: .normal)
		cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
		cancelButton.addTarget(self, action: #selector(WheelChoiceView.cancel), for: .touchUpInside)
		cancelButton.autoresizingMask = [.flexibleLeftMargin, .flexibleWidth]
		
		let doneButton = UIButton(frame: CGRect(x:headerBar.frame.maxX - 38 - 7, y: headerBar.frame.origin.y + 13.4, width: 38, height: 18))
		
		doneButton.setTitle("Done", for: .normal)
		doneButton.setTitleColor(UIColor.tapBrightBlue, for: .normal)
		doneButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
		doneButton.addTarget(self, action: #selector(WheelChoiceView.done), for: .touchUpInside)
		doneButton.autoresizingMask = [.flexibleRightMargin , .flexibleWidth]
		
		headerBar.addSubview(cancelButton)
		headerBar.addSubview(doneButton)
		
		pickerView.addSubview(headerBar)
		
		textField.inputView = pickerView
		
		addSubview(wheelChoiceView)

	}
	
	func config(with model: WheelChoiceViewModel) {
		
		self.model = model
		property.text = model.title
		textField.placeholder = model.placeholder
		
	}

}

extension WheelChoiceView : UIPickerViewDelegate {
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		
		textField.text = model.choices[component][row]
		
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

extension WheelChoiceView : UITextFieldDelegate {
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		return true 
	}
	
}
