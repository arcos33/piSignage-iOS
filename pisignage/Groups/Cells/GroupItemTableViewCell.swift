//
//  GroupItemTableViewCell.swift
//  pisignage
//
//  Created by user on 1/26/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class GroupItemTableViewCell: UITableViewCell {
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var secondStackView: UIStackView!
    @IBOutlet weak var detailsLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    var group: Group?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //mainStackView.addBackground(color: .red)
        //secondStackView.addBackground(color: .green)

        //containerStackView.addBackground(color: .yellow)
    }
    
    func configureWith(group: Group) {
        nameLabel.text = group.name
        detailsLabel.text = "\(group.playlistCount) playlist, \(group.orientation.rawValue), \(group.resolution.rawValue)"
        timestampLabel.text = "\(group.deployTimeStamp)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
