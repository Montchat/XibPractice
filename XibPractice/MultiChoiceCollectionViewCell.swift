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
	
	@IBAction func buttonPressed(_ sender: Any) {
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
	}
	
	func configure(with choice:String) {
		
		
	}
	
}
