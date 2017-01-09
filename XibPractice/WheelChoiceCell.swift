//
//  WheelChoiceCell.swift
//  XibPractice
//
//  Created by Joe Edwards on 1/9/17.
//  Copyright © 2017 HanekeDesign. All rights reserved.
//

import UIKit

class WheelChoiceCell: UITableViewCell {
	
	@IBOutlet var view: UIView!

	@IBOutlet weak var property: UILabel!
	@IBOutlet weak var selection: UILabel!
	
	@IBAction func questionPressed(_ sender: Any) {
		print("question mark pressed")
		
	}
	
	@IBAction func changeSelection(_ sender: Any) {
		print("selection changed")
		
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
		
    }
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		guard let wheelChoiceCell = Bundle.main.loadNibNamed(Component.wheelChoiceCell, owner: self, options: nil)?[0] as? UIView else { print("did not work") ; return }
		
		addSubview(wheelChoiceCell)
		
	}
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		selectionStyle = .none
		
		guard let wheelChoiceCell = Bundle.main.loadNibNamed(Component.wheelChoiceCell, owner: self, options: nil)?[0] as? UIView else { print("did not work") ; return }
		
		addSubview(wheelChoiceCell)
		
	}
	
	func config(with model: WheelChoiceViewModel) {
		property.text = model.title
		selection.text = model.placeholder
		
	}
	
}
