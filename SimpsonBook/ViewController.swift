//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Swayam Barik on 10/5/21.
//

import UIKit

// TableView
    // UITableViewDelegate/UTTableViewDataSource Extension of class
    // numberofRows in section -> return number of rows
    // cellforrowat -> return cell
    // didselectrowat

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var simpsonList = [Simpson]()
    
    var chosenSimpson : Simpson?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        // Simpson Objects
        
        let homer = Simpson(nameInput: "Homer Simpson", jobInput: "Dad", imageInput: UIImage(named: "homer")!)
        let marg = Simpson(nameInput: "Marg Simpson", jobInput: "Mom", imageInput: UIImage(named: "marg")!)
        let bart = Simpson(nameInput: "Bart Simpson", jobInput: "Son", imageInput: UIImage(named: "bart")!)
        let lisa = Simpson(nameInput: "Lisa Simpson", jobInput: "Daughter", imageInput: UIImage(named: "lisa")!)
        
        simpsonList = [homer, marg, bart, lisa]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonList.count // number of cells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = simpsonList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = simpsonList[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }

}

