//
//  SearchMovieViewController.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 18/04/23.
//

import UIKit

class SearchMovieViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Variable Declarations
    var searchMovieViewModel: SearchMovieViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.register(UINib(nibName: "SearchMovieTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchMovieTableViewCell")
        
        getSearchMovieData()
    }
    
    func getSearchMovieData() {
        searchMovieViewModel?.getSearchMovieData(searchText: "a", completion: { result in
            print(result)
        })
    }
    
    // MARK: -  IBActions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SearchMovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "SearchMovieTableViewCell", for: indexPath) as! SearchMovieTableViewCell
        return cell
    }
    
    
}
