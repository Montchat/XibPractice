//
//  MultiChoiceView.swift
//  XibPractice
//
//  Created by Joe Edwards on 1/9/17.
//  Copyright © 2017 HanekeDesign. All rights reserved.
//

import UIKit

class MultiChoiceView: UIView {
	
	var model = MultiChoiceViewModel() 

	@IBOutlet var view: UIView!
	
	@IBOutlet weak var question: UILabel!
	
	@IBOutlet weak var choicesView: UIStackView!
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		guard let sliderView = Bundle.main.loadNibNamed(Component.multiChoiceView, owner: self, options: nil)?[0] as? UIView else { print("did not work") ; return }
		
		addSubview(sliderView)
		
	}
	
	func config(with model: MultiChoiceViewModel) {
		self.model = model
		self.question.text = model.title
		
	}
	
}
