//
//  GroupsTableViewController.swift
//  pisignage
//
//  Created by user on 1/26/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController, UISearchBarDelegate {
    enum SectionType {
        case groupItem
    }
    
    let sections: [SectionType] =   [.groupItem]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let searchController = UISearchController()
        searchController.automaticallyShowsCancelButton = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
        let filterButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterOptions))
        let deployButtonItem = UIBarButtonItem(title: "Deploy", style: .done, target: self, action: #selector(deployOptions))
        
        navigationItem.leftBarButtonItems = [filterButtonItem, deployButtonItem]
        
        let newGroupButtonItem = UIBarButtonItem(title: "New group", style: .plain, target: self, action: nil)
        
        navigationItem.rightBarButtonItem = newGroupButtonItem

        configureCell()
    }
    
    @objc private func filterOptions() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Filter by category", style: .default)
        let action2 = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func deployOptions() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Deploy all", style: .default)
        let action2 = UIAlertAction(title: "Schedule deploy", style: .default)
        let action3 = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = sections[section]
        switch sectionType {
        case .groupItem:
            return 15
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = sections[indexPath.section]
        switch sectionType {
        case .groupItem:
            let cell = tableView.dequeueReusableCell(withIdentifier: GroupItemTableViewCell.identifier, for: indexPath)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionType = sections[section]
        
        switch sectionType {
        case .groupItem:
            return "Available Groups"
        }
    }
}

//  ==============================================================================
//  Internal Methods
//  ==============================================================================
extension GroupsTableViewController {
    private func configureCell() {
        tableView.register(UINib(nibName: GroupItemTableViewCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: GroupItemTableViewCell.identifier)
    }
}
