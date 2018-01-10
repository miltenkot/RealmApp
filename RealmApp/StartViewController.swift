//
//  ViewController.swift
//  RealmApp
//
//  Created by Bartek Lanczyk on 08.01.2018.
//  Copyright © 2018 miltenkot. All rights reserved.
//

import UIKit
import RealmSwift

class StartViewController: UIViewController {

    let realm = try! Realm()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addNewItems(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) {
            (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            newItem.done = false
            self.saveItem(item: newItem)
            
           
            
        }
        alert.addTextField {
            (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        
    }
    //MARK: - Data Manipulation Methods
    func saveItem(item: Item){
        
        do{
            try realm.write {
                realm.add(item)
            }
        }
        catch {
            print("Error saving context, \(error)")
        }
        
        
    }
    
}

