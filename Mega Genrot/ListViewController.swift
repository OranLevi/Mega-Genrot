//
//  ListViewController.swift
//  Mega Genrot
//
//  Created by Oran Levi on 30/10/2022.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var displayTextField: UITextField!
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var generatorButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addToListButton: UIButton!
    
    var listArray = [String]()
    var deleteButtonTap = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        listTableView.dataSource = self
        listTableView.delegate = self
        displayTextField.isUserInteractionEnabled = false
    }
    
    func setupButton() {
        addToListButton.layer.cornerRadius = 15
        deleteButton.layer.cornerRadius = 15
        generatorButton.layer.cornerRadius = 15
        copyButton.layer.cornerRadius = 15
    }
    
    @IBAction func addToListButton(_ sender: Any) {
        listTableView.isEditing = false
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Type Here"
            textField = alertTextField
        }
        let action = UIAlertAction(title: "Add to list", style: .default) { action in
            if textField.text != "" {
                self.listArray.append(textField.text!)
                self.listTableView.reloadData()
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
        }
        
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        if listArray.isEmpty {
            return
        }
        if deleteButtonTap {
            listTableView.isEditing = false
            deleteButtonTap = false
        } else {
            listTableView.isEditing = true
            deleteButtonTap = true
        }
    }
    
    @IBAction func generatorButton(_ sender: Any) {
        displayTextField.text = listArray.randomElement()
        listTableView.isEditing = false
    }
    
    @IBAction func copyButton(_ sender: Any) {
        Service().copyButton(textToCopy: displayTextField, button: copyButton)
        listTableView.isEditing = false
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath) as! ListTableViewCell
        
        cell.listTextLabel.text = listArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = listArray[sourceIndexPath.row]
        listArray.remove(at: sourceIndexPath.row)
        listArray.insert(itemToMove, at: destinationIndexPath.row)
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            self.listArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
        
        return swipeActions
    }
}
