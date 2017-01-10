//
//  WheelChoiceCell.swift
//  XibPractice
//
//  Created by Joe Edwards on 1/9/17.
//  Copyright © 2017 HanekeDesign. All rights reserved.
//

import UIKit

class WheelChoiceCell: UITableViewCell {
	
	var model:WheelChoiceViewModel = WheelChoiceViewModel()
	
	@IBOutlet var view: UIView!

	@IBOutlet weak var property: UILabel!
	
	@IBOutlet weak var selection: UIButton!
	
	@IBOutlet weak var pickerView: UIPickerView!
	@IBOutlet weak var height: NSLayoutConstraint!
	
	
	@IBAction func questionPressed(_ sender: Any) {
		print("question mark pressed")
		
	}
	
	@IBAction func changeSelection(_ sender: Any) {
		
		UIView.animate(withDuration: 0.33) { 
			self.layoutIfNeeded()
			self.height.constant = 0
		}
		
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
		
    }
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		height.constant = 0

		guard let wheelChoiceCell = Bundle.main.loadNibNamed(Component.wheelChoiceCell, owner: self, options: nil)?[0] as? UIView else { print("did not work") ; return }
		
		addSubview(wheelChoiceCell)
		
	}
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		height.constant = 0
		
		selectionStyle = .none
		
		guard let wheelChoiceCell = Bundle.main.loadNibNamed(Component.wheelChoiceCell, owner: self, options: nil)?[0] as? UIView else { print("did not work") ; return }
		
		addSubview(wheelChoiceCell)
		
	}
	
	func config(with model: WheelChoiceViewModel) {
		self.model = model
		property.text = model.title
		selection.setTitle(model.placeholder, for: .normal)
		
	}
	
}

extension WheelChoiceCell : UIPickerViewDelegate {
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		print("selected")
	}
}

extension WheelChoiceCell : UIPickerViewDataSource {
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return 3
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return "test"

	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return model.choices.count
	}
	
}

