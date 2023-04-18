//
//  MovieDetailsHeaderView.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 13/04/23.
//

import UIKit

class MovieDetailsHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLbl: UILabel!

     static func loadHeaderView() -> UIView {
        return  UINib.init(nibName: "MovieDetailsHeaderView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! MovieDetailsHeaderView
    }
    

}
