//
//  SimilarResultsTableViewCell.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 17/04/23.
//

import UIKit
import SDWebImage

class SimilarResultsTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var similarResultCollectionView: UICollectionView!
    
    // MARK: - Variable Declarations
    var similartResultArr = [SimilarMoviesResult]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func registerMovieDetailsCollectionView(dataInfo: [SimilarMoviesResult]) {
        self.similartResultArr = dataInfo
        self.similarResultCollectionView.delegate = self
        self.similarResultCollectionView.dataSource = self
        self.similarResultCollectionView.register(UINib.init(nibName: "SimilarResultsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SimilarResultsCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}



extension SimilarResultsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similartResultArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimilarResultsCollectionViewCell", for: indexPath) as! SimilarResultsCollectionViewCell
        if similartResultArr.count > 0 {
            
            let imgBaseURL = "https://image.tmdb.org/t/p/original/"
            let imgEndURL = similartResultArr[indexPath.item].poster_path ?? ""
            let imgURL = imgBaseURL + imgEndURL
            cell.imgView.sd_setImage(with: URL(string: imgURL), placeholderImage: UIImage(named: "placeholder_icon"))
            cell.imgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cell.nameLbl.text = similartResultArr[indexPath.item].title
        }
        return cell
    }
}

extension SimilarResultsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = similarResultCollectionView.bounds.size.width / 3 - 16
        let height = similarResultCollectionView.bounds.size.height - 20
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7.0
    }
     
}
