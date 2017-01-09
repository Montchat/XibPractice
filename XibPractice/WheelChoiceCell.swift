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
	
	var pickerView:UIPickerView?
	
	@IBAction func questionPressed(_ sender: Any) {
		print("question mark pressed")
		
	}
	
	@IBAction func changeSelection(_ sender: Any) {
		print("selection changed")
		
		if pickerView == nil {

			backgroundColor = UIColor.red
			view.backgroundColor = UIColor.green
			
//			startFrame.origin.y = frame.height
//			endFrame.origin.y = startFrame.origin.y - endFrame.height
//			
			let pickerView = UIPickerView(frame: view.frame)
			pickerView.delegate = self ; pickerView.dataSource = self
			addSubview(pickerView)
			
			self.pickerView = pickerView
//
//			UIView.animate(withDuration: 0.33, animations: {
//
//				print(pickerView.frame)
//				
//			}, completion: { (bool) in
//				
//				print("completed")
//				
//			})
			
		} else {
			
			guard let pickerView = self.pickerView else { return }
			pickerView.removeFromSuperview()
			
		}
		
//		NSDictionary *itemData = self.dataArray[indexPath.row];
//		[self.pickerView setDate:[itemData valueForKey:kDateKey] animated:YES];
//		
//		// the date picker might already be showing, so don't add it to our view
//		if (self.pickerView.superview == nil)
//		{
//			CGRect startFrame = self.pickerView.frame;
//			CGRect endFrame = self.pickerView.frame;
//			
//			// the start position is below the bottom of the visible frame
//			startFrame.origin.y = CGRectGetHeight(self.view.frame);
//			
//			// the end position is slid up by the height of the view
//			endFrame.origin.y = startFrame.origin.y - CGRectGetHeight(endFrame);
//			
//			self.pickerView.frame = startFrame;
//			
//			[self.view addSubview:self.pickerView];
//			
//			// animate the date picker into view
//			[UIView animateWithDuration:kPickerAnimationDuration animations: ^{ self.pickerView.frame = endFrame; }
//				completion:^(BOOL finished) {
//				// add the "Done" button to the nav bar
//				self.navigationItem.rightBarButtonItem = self.doneButton;
//				}];
//		}

		
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

