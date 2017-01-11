//
//  MultiChoiceCollectionViewCell.swift
//  XibPractice
//
//  Created by Joe Edwards on 1/10/17.
//  Copyright © 2017 HanekeDesign. All rights reserved.
//

import UIKit

class MultiChoiceCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var button: UIButton!
	
	static var identifier = "MultiChoiceCollectionViewCell"
	
	@IBAction func buttonPressed(_ sender: Any) {
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
	}
	
	func configure(with choice:String) {
		button.setTitle(choice, for: .normal)
		button.setImage(#imageLiteral(resourceName: "circleUnchecked"), for: .normal)
		button.setImage(#imageLiteral(resourceName: "circleChecked"), for: .selected)
		
	}
	
}
