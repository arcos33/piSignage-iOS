//
//  UIStackView+Extras.swift
//  pisignage
//
//  Created by user on 1/26/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}

