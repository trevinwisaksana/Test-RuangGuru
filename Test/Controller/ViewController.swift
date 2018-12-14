//
//  ViewController.swift
//  Test
//
//  Created by Trevin Wisaksana on 14/12/18.
//  Copyright © 2018 Trevin Wisaksana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Internal Properties
    
    private var dataSource: DataSource = {
        let dataSource = DataSource()
        return dataSource
    }()
    
    // MARK: - VC Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
       
        dataSource.loadData()
    }

}


// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == dataSource.numberOfItems - 1 {
            dataSource.paginate(currentIndex: indexPath.row)
            tableView.reloadData()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NumberCell", for: indexPath) as! NumberCell
        cell.model = dataSource.item(at: indexPath)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
