//
//  MovieDetailTableViewCell.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 13/04/23.
//

import UIKit

class MovieDetailTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var voteAvgCountLbl: UILabel!
    @IBOutlet weak var descTitleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
