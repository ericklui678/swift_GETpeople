//
//  FilmTableTableViewController.swift
//  GETpeople
//
//  Created by Erick Lui on 7/17/17.
//  Copyright © 2017 Erick Lui. All rights reserved.
//

import UIKit

class FilmTableTableViewController: UITableViewController {
  
  var films = [NSDictionary]()

  override func viewDidLoad() {
    super.viewDidLoad()
    StarWarsModel.getAllFilms(completionHandler: {
      data, response, error in
      do {
        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
          if let results = jsonResult["results"] as? [NSDictionary] {
            self.films = results
//            for film in results {
//              let filmDict = film as! NSDictionary
//              self.films.append(filmDict["title"]! as! String)
//            }
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
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return films.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
    cell.textLabel?.text = films[indexPath.row]["title"] as? String
    return cell
  }
  override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    performSegue(withIdentifier: "FilmDetailsSegue", sender: indexPath.row)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let index = sender as! Int
    let detailVC = segue.destination as! FilmDetailViewController
    detailVC.titleName = films[index]["title"] as? String
    detailVC.release = films[index]["release_date"] as? String
    detailVC.director = films[index]["director"] as? String
    detailVC.opening = films[index]["opening_crawl"] as? String
  }
}
