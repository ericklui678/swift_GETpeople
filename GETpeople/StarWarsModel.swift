//
//  StarWarsModel.swift
//  GETpeople
//
//  Created by Erick Lui on 7/17/17.
//  Copyright © 2017 Erick Lui. All rights reserved.
//

import Foundation

class StarWarsModel {
  static func getAllPeople(completionHandler: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
    // specify the url that we will be sending the GET request to
    let url = URL(string: "http://swapi.co/api/people/")
    // create a URLSession to handle the request tasks
    let session = URLSession.shared
    // create a "data task" which will request some data from a URL and then run the completion handler that we are passing into the getAllPeople function itself
    let task = session.dataTask(with: url!, completionHandler: completionHandler)
    // Actually "execute" the task. This is the line that actually makes the request we set up above
    task.resume()
  }
  static func getAllFilms(completionHandler: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
    let url = URL(string: "http://swapi.co/api/films/")
    let session = URLSession.shared
    let task = session.dataTask(with: url!, completionHandler: completionHandler)
    task.resume()
  }
}
