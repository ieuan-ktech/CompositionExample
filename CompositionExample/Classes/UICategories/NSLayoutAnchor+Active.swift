//
//  UIView+Constraints.swift
//
//
//  Created by Hayden Young on 04/05/2017.
//  Copyright © 2017. All rights reserved.
//

import UIKit

extension NSLayoutAnchor {
	
	@discardableResult open func activateConstraint(equalTo anchor: NSLayoutAnchor<AnchorType>, constant c: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
		let constraint = self.constraint(equalTo: anchor, constant: c)
		constraint.priority = priority
		constraint.isActive = true
		return constraint
	}
	
	@discardableResult open func activateConstraint(greaterThanOrEqualTo anchor: NSLayoutAnchor<AnchorType>, constant c: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
		let constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: c)
		constraint.priority = priority
		constraint.isActive = true
		return constraint
	}
	
	@discardableResult open func activateConstraint(lessThanOrEqualTo anchor: NSLayoutAnchor<AnchorType>, constant c: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
		let constraint = self.constraint(lessThanOrEqualTo: anchor, constant: c)
		constraint.priority = priority
		constraint.isActive = true
		return constraint
	}
}

