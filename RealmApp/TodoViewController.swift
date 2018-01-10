//
//  TodoViewController.swift
//  RealmApp
//
//  Created by Bartek Lanczyk on 08.01.2018.
//  Copyright © 2018 miltenkot. All rights reserved.
//

import UIKit
import RealmSwift

class TodoViewController: UITableViewController {

    let realm = try! Realm()
    
    var itemArray : Results<Item>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = itemArray?[indexPath.row].title ?? "No items here"
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray?.count ?? 1
    }
    //MARK: - Data Manipulation Methods
    func loadItems(){
        
      itemArray = realm.objects(Item.self)
      
    }

    

}
