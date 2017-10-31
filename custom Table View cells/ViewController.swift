//
//  ViewController.swift
//  custom Table View cells
//
//  Created by C4Q on 10/31/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

   
    var movies: [Movie] = []
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadData() {
        let allMovies = MovieData.movies
        let sortedMovies = allMovies.sorted{$0.name < $1.name}
        self.movies = sortedMovies
    }
    
    // two required Data Source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movie Cell", for: indexPath)
        if let movieCell = cell as? MovieTableViewCell {
            let rowToSetUp = indexPath.row
            let movieToSetUp = movies[rowToSetUp]
            movieCell.titleLabel.text = movieToSetUp.name
            movieCell.descriptionLabel.text = movieToSetUp.description
            movieCell.posterImage.image = UIImage(named: movieToSetUp.posterImageName)
            return movieCell
        } else {
            return cell
        }

    }
    
   
    
}
    
    
    
    
    
    



