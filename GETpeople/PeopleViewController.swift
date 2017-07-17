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
  var people = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    StarWarsModel.getAllPeople(completionHandler: {
      data, response, error in
      do {
        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
          if let results = jsonResult["results"] as? NSArray {
            for person in results {
              let personDict = person as! NSDictionary
              self.people.append(personDict["name"]! as! String)
            }
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
    cell.textLabel?.text = people[indexPath.row]
    return cell
  }
}

