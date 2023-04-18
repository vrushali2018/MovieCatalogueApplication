//
//  MovieDetailsCastTableViewCell.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 13/04/23.
//

import UIKit
import SDWebImage

class CastTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    // MARK: - Variable Declarations
    var castDataArr = [Cast]()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerCastMovieDetailsCollectionView(dataInfo: [Cast]) {
        self.castDataArr = dataInfo
        self.movieCollectionView.delegate = self
        self.movieCollectionView.dataSource = self
        self.movieCollectionView.register(UINib.init(nibName: "CastCrewDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CastCrewDetailCollectionViewCell")
    }
 
    
}

extension CastTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castDataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCrewDetailCollectionViewCell", for: indexPath) as! CastCrewDetailCollectionViewCell
        if castDataArr.count > 0 {
            cell.nameLbl.text = castDataArr[indexPath.item].name
            
            let imgBaseURL = "https://image.tmdb.org/t/p/original/"
            let imgEndURL = castDataArr[indexPath.item].profile_path ?? ""
            let imgURL = imgBaseURL + imgEndURL
            cell.imgView.sd_setImage(with: URL(string: imgURL), placeholderImage: UIImage(named: "User"))
            cell.imgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        }
         
        return cell
    }
}

extension CastTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = movieCollectionView.bounds.size.width / 3 - 25
       let height = movieCollectionView.bounds.size.height
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
