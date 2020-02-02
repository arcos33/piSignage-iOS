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
    var groups: [Group] = []
    let sections: [SectionType] =   [.groupItem]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSearchController()
        setupButtonItems()
        configureCell()
        configureTableView()
        populateModels()
    }
    
    private func populateModels() {
        groups = [
            Group(name: "Burger Joint", deployTimeStamp: "Jan 3, 5:15PM", playlistCount: 3, orientation: .landscape, resolution: .HD1080p),
            Group(name: "Burger Joint", deployTimeStamp: "Jan 2, 2:11AM", playlistCount: 1, orientation: .landscape, resolution: .HD720p),
            Group(name: "Mc Donald's", deployTimeStamp: "Dec 28, 1:32PM", playlistCount: 1, orientation: .portraitLeft, resolution: .HD1080p),
            Group(name: "Burger King", deployTimeStamp: "Dec 17, 8:02PM", playlistCount: 2, orientation: .portraitLeft, resolution: .HD1080p),
            Group(name: "Carl's Jr", deployTimeStamp: "Dec 23, 12:02PM", playlistCount: 1, orientation: .landscape, resolution: .HD720p)
        ]
    }
    
    private func setupSearchController() {
        let searchController = UISearchController()
        searchController.automaticallyShowsCancelButton = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    private func setupButtonItems() {
        let filterButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterOptions))
        let deployButtonItem = UIBarButtonItem(title: "Deploy", style: .done, target: self, action: #selector(deployOptions))
        navigationItem.leftBarButtonItems = [filterButtonItem, deployButtonItem]
        
        let newGroupButtonItem = UIBarButtonItem(title: "New group", style: .plain, target: self, action: #selector(setupNewGroupAlert))
        
        navigationItem.rightBarButtonItem = newGroupButtonItem
    }
    
    private func configureTableView() {
        tableView.bounces = false
    }
    
    @objc private func filterOptions() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Filter by category", style: .default)
        let action2 = UIAlertAction(title: "Cancel", style: .default)
        action2.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func deployOptions() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Deploy all", style: .default)
        let action2 = UIAlertAction(title: "Schedule deploy", style: .default)
        let action3 = UIAlertAction(title: "Cancel", style: .default)
        action3.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func setupNewGroupAlert() {
        let alert = UIAlertController(title: nil, message: "Enter a group name", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Save", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(okButton)
        alert.addAction(cancelAction)
        alert.addTextField { (textfield) in

        }
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
            return groups.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = sections[indexPath.section]
        switch sectionType {
        case .groupItem:
            let group = groups[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupItemTableViewCell.identifier, for: indexPath) as? GroupItemTableViewCell else { return UITableViewCell() }
            cell.configureWith(group: group)
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
