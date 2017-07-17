//
//  CharacterInfoViewController.swift
//  GETpeople
//
//  Created by Erick Lui on 7/17/17.
//  Copyright © 2017 Erick Lui. All rights reserved.
//

import UIKit

class CharacterInfoViewController: UIViewController {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var genderLabel: UILabel!
  @IBOutlet weak var birthLabel: UILabel!
  @IBOutlet weak var massLabel: UILabel!
  
  var name: String?
  var gender: String?
  var birth: String?
  var mass: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    nameLabel.text = "Name: \(name!)"
    genderLabel.text = "Gender: \(gender!)"
    birthLabel.text = "Birth Year: \(birth!)"
    massLabel.text = "Mass: \(mass!)"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
