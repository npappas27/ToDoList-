//
//  CategoryViewController.swift
//  ToDoList
//
//  Created by Nick Pappas on 11/8/18.
//  Copyright © 2018 Nick Pappas. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
    let realm = try! Realm()
    
    var categories: Results<Category>?
    
//     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
 
    }
    

    
    //MARK: - Table View Data Source Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet"
        cell.textLabel?.textColor = FlatWhite()s
        cell.backgroundColor = UIColor(hexString: ((categories?[indexPath.row].colorHex)!))
        
        return cell
    }
    
  
    
    //MARK: - Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    //MARK: - Add new categories
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let addItemAlert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default)
            
        {   (action) in
            let newCategory = Category()
            newCategory.name = textField.text!
            newCategory.colorHex = UIColor.randomFlat.hexValue()
            self.save(from:  newCategory)
        }
        
        addItemAlert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        
        addItemAlert.addAction(action)
        present(addItemAlert, animated: true)
    }
    
    
    func save(from category : Category){
        do  {
            try realm.write {
                realm.add(category)
            }
        }
        catch {
            print("Error saving context \(error)")
        }
        self.tableView.reloadData()
    }

    
    func loadCategories(){
        categories = realm.objects(Category.self)
//        do {
//            categoryArray = try context.fetch(request)
//        } catch {
//            print("error fetching data \(error)")
//        }
        tableView.reloadData()
    }

    override func updateModel(at indexPath: IndexPath) {
        if let item = self.categories?[indexPath.row] {
            try! self.realm.write {
                self.realm.delete(item)
                }
            }
    }
    
    
}



