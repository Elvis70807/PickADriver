//
//  PeriodTableViewController.swift
//  PickADriver
//
//  Created by Elvis Conte on 3/31/21.
//

import UIKit

class PeriodTableViewController: UITableViewController {
    
    var selectedPeriod = 0
    var names = [["John", "Jim", "Bob", "Joe", "Phil","Jill", "First"], ["John", "Jim", "Bob", "Joe", "Phil","Jill", "Second"], ["John", "Jim", "Bob", "Joe", "Phil","Jill", "Third"], ["John", "Jim", "Bob", "Joe", "Phil","Jill", "Forth"], ["John", "Jim", "Bob", "Joe", "Phil","Jill", "Fifth"], ["John", "Jim", "Bob", "Joe", "Phil","Jill", "Sixth"], ["John", "Jim", "Bob", "Joe", "Phil","Seventh", "Frank"], ["John", "Jim", "Bob", "Joe", "Phil","Jill", "Eighth"]]
    var selectedNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPeriod = indexPath.row + 1
        selectedNames = names[indexPath.row]
        performSegue(withIdentifier: "PeriodToNames", sender: nil)
    }
   
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let namesTableVC = segue.destination as? NamesTableViewController {
            namesTableVC.names = selectedNames
            namesTableVC.period = selectedPeriod
        }
    }

}
