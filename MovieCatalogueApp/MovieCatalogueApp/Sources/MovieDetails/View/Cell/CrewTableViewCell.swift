//
//  CrewTableViewCell.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 17/04/23.
//


import UIKit
import SDWebImage

class CrewTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var crewCollectionView: UICollectionView!
    
    // MARK: - Variable Declarations
    var crewDataArr = [Crew]()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerCrewMovieDetailsCollectionView(dataInfo: [Crew]) {
        self.crewDataArr = dataInfo
        self.crewCollectionView.delegate = self
        self.crewCollectionView.dataSource = self
        self.crewCollectionView.register(UINib.init(nibName: "CastCrewDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CastCrewDetailCollectionViewCell")
    }
    
}

extension CrewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return crewDataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCrewDetailCollectionViewCell", for: indexPath) as! CastCrewDetailCollectionViewCell
        if crewDataArr.count > 0 {
            cell.nameLbl.text = crewDataArr[indexPath.item].name
            
            let imgBaseURL = "https://image.tmdb.org/t/p/original/"
            let imgEndURL = crewDataArr[indexPath.item].profile_path ?? ""
            let imgURL = imgBaseURL + imgEndURL
            cell.imgView.sd_setImage(with: URL(string: imgURL), placeholderImage: UIImage(named: "User"))
            cell.imgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        }
         
        return cell
    }
}



extension CrewTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = crewCollectionView.bounds.size.width / 3 - 25
       let height = crewCollectionView.bounds.size.height
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
