//
//  UIViewExtension.swift
//  XibPractice
//
//  Created by Joe Edwards on 1/5/17.
//  Copyright © 2017 HanekeDesign. All rights reserved.
//

import UIKit
extension UIView {
	
	@discardableResult   // 1
	func fromNib<T : UIView>() -> T? {   // 2
		guard let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?[0] as? T else {    // 3
			// xib not loaded, or it's top view is of the wrong type
			return nil
		}
		self.addSubview(view)     // 4
		view.translatesAutoresizingMaskIntoConstraints = false   // 5
		return view   // 7
	}
	
}
