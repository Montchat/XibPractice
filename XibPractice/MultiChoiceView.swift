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
		
		for view in choicesView.subviews { view.removeFromSuperview() }
		
		for (index, choice) in model.choices.enumerated() {
			let button = UIButton(type: .custom)
			button.tag = index
			button.setTitle(choice, for: .normal)
			button.setTitleColor(UIColor.black, for: .normal)
			button.setImage(#imageLiteral(resourceName: "circleUnchecked"), for: .normal)
			button.setImage(#imageLiteral(resourceName: "circleChecked"), for: .selected)
			button.addTarget(self, action: #selector(choose(button:)), for: .touchUpInside)
			
			if let select = model.index, select == index {
				button.isSelected = true
			}
			button.sizeToFit()
			choicesView.addArrangedSubview(button)
			
		}
		
		self.model = model
		self.question.text = model.title
		
	}
	
	func choose(button:UIButton) {
		print("selected")
		model.update(button.tag)
		
	}
	
}
