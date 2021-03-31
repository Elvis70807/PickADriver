//
//  NamesTableViewController.swift
//  PickADriver
//
//  Created by Elvis Conte on 3/24/21.
//

import UIKit

class NamesTableViewController: UITableViewController {
    
    var names = ["John", "Jim", "Bob", "Joe", "Phil","Jill", "Frank"]
    var period = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Period \(period)"

        tableView.isEditing = true
    }

    // MARK: - Table view data source
    
    @IBAction func onAddButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add a name", message: nil, preferredStyle: .alert)
        var nameField: UITextField?
        alert
            .addTextField{ (textField) in
                nameField = textField
                nameField?.placeholder = "name"
            }
        let cancelAction = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        let confirmAction = UIAlertAction(title: "OK", style: .default) {(action) in
            if let name = nameField?.text {
                self.names.append(name)
                self.tableView.reloadData()
            }
        }
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)

        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let namesToMove = names.remove(at: fromIndexPath.row)
        names.insert(namesToMove, at: to.row)
        
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

  

}
