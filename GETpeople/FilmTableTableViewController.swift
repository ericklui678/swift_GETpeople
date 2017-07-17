//
//  FilmTableTableViewController.swift
//  GETpeople
//
//  Created by Erick Lui on 7/17/17.
//  Copyright © 2017 Erick Lui. All rights reserved.
//

import UIKit

class FilmTableTableViewController: UITableViewController {
  
  var films = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()
    let url = URL(string: "http://swapi.co/api/films")
    let session = URLSession.shared
    let task = session.dataTask(with: url!, completionHandler: {
      data, response, error in
      do {
        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
          if let results = jsonResult["results"] as? NSArray {
            for object in results {
              let film = object as! NSDictionary
              self.films.append(film["title"]! as! String)
              DispatchQueue.main.async {
                self.tableView.reloadData()
              }
            }
          }
        }
      } catch {
        print("Error", error)
      }
    })
    task.resume()
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return films.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = films[indexPath.row]
    return cell
  }
}
