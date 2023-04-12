//
//  MovieListViewController.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 12/04/23.
//

import UIKit

class MovieListViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
     
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
