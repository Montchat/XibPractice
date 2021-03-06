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
		
		guard let sliderView = Bundle.main.loadNibNamed(Component.multiChoiceView, owner: self, options: nil)?[0] as? UIView else { return }

		choicesView.register(UINib(nibName: MultiChoiceCollectionViewCell.identifier, bundle:nil), forCellWithReuseIdentifier:  MultiChoiceCollectionViewCell.identifier)
		choicesView.bounces = false
	
		addSubview(sliderView)
		
	}
	
	func config(with model: MultiChoiceViewModel) {
		
		self.model = model
		
		choicesView.delegate = self ; choicesView.dataSource = self
		question.text = model.title
		choicesView.reloadData()
		
	}
	
}

extension MultiChoiceView : UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return model.choices.count
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		model.update(indexPath.item)
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
}
extension MultiChoiceView : UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: MultiChoiceCollectionViewCell.identifier, for: indexPath) as? MultiChoiceCollectionViewCell else { return UICollectionViewCell() }
		
		let indexPath = indexPath.row
		
		if let index = model.index {
			if indexPath == index {
				collectionViewCell.button.isSelected = true
			} else {
				collectionViewCell.button.isSelected = false
			}
			
		}
		
		collectionViewCell.configure(with: model.choices[indexPath])
		
		return collectionViewCell 
	}

}

extension MultiChoiceView : UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = collectionView.bounds.size.width / CGFloat(model.choices.count)
		let height = collectionView.bounds.size.height
		
		return CGSize(width: width, height: height)
		
	}
	
}
