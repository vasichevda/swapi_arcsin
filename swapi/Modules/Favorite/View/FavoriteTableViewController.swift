//
//  FavoriteTableViewController.swift
//  swapi
//
//  Created by Denis Vasichev on 20/07/2019.
//  Copyright © 2019 Denis Vasichev. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var presenter: FavoritePresentation?
    
    fileprivate var items: [String] = [] {
        didSet {
            if !items.isEmpty {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "favorite.title".localized
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if items.indices.contains(indexPath.row) {
            presenter?.didSelectItem(withName: items[indexPath.row])
        }
    }
    
}

extension FavoriteTableViewController: FavoriteView {
    
    func reloadData(withItems items: [String]) {
        self.items = items
    }
    
}
