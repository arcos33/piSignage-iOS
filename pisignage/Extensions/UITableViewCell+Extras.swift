//
//  UITableViewCell+Extras.swift
//  pisignage
//
//  Created by user on 1/26/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

extension UITableViewController {
    var cellIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
