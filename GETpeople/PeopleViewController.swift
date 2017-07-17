//
//  ViewController.swift
//  GETpeople
//
//  Created by Erick Lui on 7/17/17.
//  Copyright © 2017 Erick Lui. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {
  // people as an array of dictionaries
  var people = [NSDictionary]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    StarWarsModel.getAllPeople(completionHandler: {
      data, response, error in
      do {
        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
          if let results = jsonResult["results"] as? [NSDictionary] {
            self.people = results
            print(self.people)
          }
        }
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      } catch {
        print(error)
      }
    })
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
    cell.textLabel?.text = people[indexPath.row]["name"] as? String
    return cell
  }
  override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    performSegue(withIdentifier: "InfoSegue", sender: indexPath.row)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let infoVC = segue.destination as! CharacterInfoViewController
    let index = sender as! Int
    infoVC.name = people[index]["name"] as? String
    infoVC.gender = people[index]["gender"] as? String
    infoVC.birth = people[index]["birth_year"] as? String
    infoVC.mass = people[index]["mass"] as? String
  }
  @IBAction func unwindToPeopleVC(segue: UIStoryboardSegue) {
    
  }
}

