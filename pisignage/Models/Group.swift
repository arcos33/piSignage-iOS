//
//  Group.swift
//  pisignage
//
//  Created by user on 1/31/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

struct Group {
    var name: String
    var deployTimeStamp: String
    var playlistCount: Int
    var orientation: Orientation
    var resolution: Resolution
}

enum Orientation: String, CaseIterable {
    case landscape = "landscape"
    case portraitLeft = "portrait left"
    case portraitRight = "portrait right"
}

enum Resolution: String, CaseIterable {
    case HD1080p = "1080p"
    case HD720p = "720p"
}
