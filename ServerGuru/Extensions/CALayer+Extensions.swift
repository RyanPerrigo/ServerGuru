//
//  CALayer+Extensions.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/16/21.
//

import UIKit


extension CALayer {

	func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {

		let border = CALayer()

		switch edge {
		case UIRectEdge.top:
			border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
			break
		case UIRectEdge.bottom:
			border.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: thickness)
			break
		case UIRectEdge.left:
			border.frame = CGRect(x: 0, y: self.frame.height, width: thickness, height: -self.frame.height)
			break
		case UIRectEdge.right:
			border.frame = CGRect(x: self.frame.width, y: 0, width: thickness, height: self.frame.height + 2)
			break
		default:
			break
		}

		border.backgroundColor = color.cgColor;

		self.addSublayer(border)
	}

}
