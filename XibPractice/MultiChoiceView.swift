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
	
	@IBOutlet weak var choicesView: UICollectionView!
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		guard let sliderView = Bundle.main.loadNibNamed(Component.multiChoiceView, owner: self, options: nil)?[0] as? UIView else { print("did not work") ; return }
		choicesView.register(UINib(nibName: "MultiChoiceCollectionViewCell", bundle:nil), forCellWithReuseIdentifier:  "MultiChoiceCollectionViewCell")
	
		addSubview(sliderView)
		
	}
	
	func config(with model: MultiChoiceViewModel) {
		
		choicesView.delegate = self ; choicesView.dataSource = self
		
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
			
		}
		
		self.model = model
		self.question.text = model.title
		
	}
	
	func choose(button:UIButton) {
		model.update(button.tag)
		
	}
	
}

extension MultiChoiceView : UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return model.choices.count
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
}
extension MultiChoiceView : UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MultiChoiceCollectionViewCell", for: indexPath) as? MultiChoiceCollectionViewCell else { return UICollectionViewCell() }
		
		collectionViewCell.configure(with: model.choices[indexPath.row])
		
		return collectionViewCell 
	}

}
