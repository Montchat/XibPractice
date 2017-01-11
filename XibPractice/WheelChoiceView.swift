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
	
	var pickerView = UIPickerView()
	
	var oldValue:[Int] = []
	
	@IBAction func questionPressed(_ sender: Any) {
		print("question pressed")
		
	}
	
	@IBAction func addOrRemove(_ sender: Any) {
		if model.choice == "" {
			textField.becomeFirstResponder()
		} else {
			model.update([])
			textField.resignFirstResponder()
			
		}
		
	}
	
	func cancel() {
		model.update(oldValue)
		textField.resignFirstResponder()
		
	}
	
	func done() {
		
		let components = pickerView.numberOfComponents
		
		var indexes:[Int] = []
		
		for i in 0  ..< components  {
			
			let index = pickerView.selectedRow(inComponent: i)
			indexes.append(index)
			
		}
		
		model.update(indexes)
		textField.resignFirstResponder()
		
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		guard let wheelChoiceView = Bundle.main.loadNibNamed(Component.wheelChoiceView, owner: self, options: nil)?[0] as? UIView else { return }
		
		textField.delegate = self ; textField.allowsEditingTextAttributes = false
		
		let pickerView = UIPickerView()
		pickerView.autoresizingMask = .flexibleWidth
		
		let pickerContainer = UIView(frame: pickerView.frame)
		pickerContainer.autoresizingMask = .flexibleWidth
		pickerView.delegate = self ; pickerView.dataSource = self
		
		let headerBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: pickerView.frame.width, height: 44))
		
		headerBar.autoresizingMask = .flexibleWidth
		headerBar.barStyle = .default
		
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
		
		pickerContainer.addSubview(pickerView)
		pickerContainer.addSubview(headerBar)
		
		textField.inputView = pickerContainer
		self.pickerView = pickerView
		
		addSubview(wheelChoiceView)

	}
	
	func config(with model: WheelChoiceViewModel) {
		
		self.model = model
		
		switch model.choice {
		case "":
			selection.setImage(#imageLiteral(resourceName: "add"), for: .normal)
		default:
			selection.setImage(#imageLiteral(resourceName: "delete"), for: .normal)
		}
		
		property.text = model.title
		textField.placeholder = model.placeholder
		textField.text = model.choice
		
	}

}

extension WheelChoiceView : UIPickerViewDelegate {
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		
		let components = pickerView.numberOfComponents
		
		var indexes:[Int] = []
		
		for i in 0  ..< components  {
			
			let index = pickerView.selectedRow(inComponent: i)
			indexes.append(index)
			
		}
		
		model.update(indexes)
		
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
		oldValue = model.indexes
		
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		textField.resignFirstResponder()
		
	}
	
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		return true 
	}
	
}
