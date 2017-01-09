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
	var headerBar: UIView?
	
	@IBAction func questionPressed(_ sender: Any) {
		print("question mark pressed")
		
	}
	
	@IBAction func changeSelection(_ sender: Any) {
		print("selection changed")
		
		if pickerView == nil {
			
			var startFrame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width, height: 0)
			let headerBarEndFrame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width, height: 43.3)
			let pickerViewEndFrame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width, height: 150)
			
			startFrame.origin.y = frame.height
			
			let headerBar = UIView(frame:startFrame)
			headerBar.layer.borderWidth = 0.50
			headerBar.layer.masksToBounds = true
			
			headerBar.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
			
			let pickerView = UIPickerView(frame:startFrame)
			
			pickerView.delegate = self ; pickerView.dataSource = self
			
			let cancelButton = UIButton(frame: CGRect(x: 7, y: headerBar.frame.origin.y + 13.4, width: 48, height: 18))
			cancelButton.setTitle("Cancel", for: .normal)
			
			pickerView.addSubview(cancelButton)
			
			let addButton = UIButton(frame: CGRect(x:headerBar.frame.maxX - 38 - 7, y: headerBar.frame.origin.y + 13.4, width: 38, height: 18))
			addButton.setTitle("Ok", for: .normal)
			
			headerBar.addSubview(cancelButton)
			headerBar.addSubview(addButton)
			
			addSubview(headerBar)
			
			addSubview(pickerView)
			
			self.pickerView = pickerView
			self.headerBar = headerBar

			UIView.animate(withDuration: 0.33, animations: {
				
				headerBar.frame = headerBarEndFrame
				pickerView.frame = pickerViewEndFrame
				
			}, completion: { (bool) in
				
			})
			
		} else {
			
			guard let pickerView = self.pickerView else { return }
			guard let headerBar = self.headerBar else { return }
			pickerView.removeFromSuperview()
			headerBar.removeFromSuperview()
			self.pickerView = nil
			self.headerBar = nil
			
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

