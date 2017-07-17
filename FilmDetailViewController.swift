//
//  FilmDetailViewController.swift
//  GETpeople
//
//  Created by Erick Lui on 7/17/17.
//  Copyright © 2017 Erick Lui. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var releaseLabel: UILabel!
  @IBOutlet weak var directorLabel: UILabel!
  @IBOutlet weak var openingLabel: UILabel!
  
  var titleName: String?
  var release: String?
  var director: String?
  var opening: String?

  override func viewDidLoad() {
    super.viewDidLoad()
    titleLabel.text = "Title: \(titleName!)"
    releaseLabel.text = "Release Date: \(release!)"
    directorLabel.text = "Director: \(director!)"
    openingLabel.text = "Opening Crawl: \(opening!)"
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
