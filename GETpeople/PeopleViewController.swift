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
    // specify URL
    let url = URL(string: "http://swapi.co/api/people")
    // create URLSession to handle the request tasks
    let session = URLSession.shared
    // create task to make the request and run the completion handler
    let task = session.dataTask(with: url!, completionHandler: {
      data, response, error in
      do {
        // Try converting data object into JSON and typecast as NSDictionary
        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
          if let results = jsonResult["results"] {
            // save people as an array of dictionaries
            self.people = results as! [NSDictionary]
            DispatchQueue.main.async {
              self.tableView.reloadData()
            }
          }
        }
      } catch {
        print(error)
      }
    })
    task.resume()
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
    cell.textLabel?.text = people[indexPath.row]["name"] as! String
    return cell
  }
}

