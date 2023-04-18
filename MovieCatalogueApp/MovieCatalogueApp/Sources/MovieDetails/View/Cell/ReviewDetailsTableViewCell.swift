//
//  ReviewDetailsTableViewCell.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 13/04/23.
//

import UIKit

class ReviewDetailsTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var viewAllReviewsBtn: UIButton!
    @IBOutlet weak var reviewLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
     
    
    override func awakeFromNib() {
        super.awakeFromNib()
         
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
     
    
}
