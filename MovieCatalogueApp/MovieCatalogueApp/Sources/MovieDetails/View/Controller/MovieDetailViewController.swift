//
//  MovieDetailViewController.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 12/04/23.
//

import UIKit
import SDWebImage

enum ReviewHeaderConstant: String, CaseIterable {
    case movieDetails = "MovieDetails"
    case Cast = "Cast"
    case Crew = "Crew"
    case Reviews = "Reviews"
    case similarResults = "Similar Results"
}

class MovieDetailViewController: UIViewController {
    
    
    
    // MARK: - IBOutlet
    @IBOutlet weak var tblView: UITableView!
    
    // MARK: - Variable Declarations
    var movieId = 0
    var reviewHeaderArr: [String] = ReviewHeaderConstant.allCases.map{ $0.rawValue }
    var isViewAllReview = false
    var movieDetailsArr: MovieDetailsModel?
    var movieDetailsViewModel = MovieDetailsViewModel(movieService: MovieDetailsService(networkManager: NetworkManager.shared))
    var cityStr = ""
    var castDataArr = [Cast]()
    var crewDataArr = [Crew]()
    var similartResultArr = [SimilarMoviesResult]()
    var reviewDataArr = [ReviewResult]()
    
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        tblView.register(UINib(nibName: "MovieDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieDetailTableViewCell")
        tblView.register(UINib(nibName: "CastTableViewCell", bundle: nil), forCellReuseIdentifier: "CastTableViewCell")
        tblView.register(UINib(nibName: "CrewTableViewCell", bundle: nil), forCellReuseIdentifier: "CrewTableViewCell")
        tblView.register(UINib(nibName: "ReviewDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewDetailsTableViewCell")
        tblView.register(UINib(nibName: "SimilarResultsTableViewCell", bundle: nil), forCellReuseIdentifier: "SimilarResultsTableViewCell")
        
        getMovieDetailsData()
        getCastAndCrewDetailsData()
        getReviewsData()
        getSimilarMoviesData()
    }
    
    
    func getMovieDetailsData() {
        self.movieDetailsViewModel.getMovieDetails(movieId: movieId) { result in
            if result {
                self.movieDetailsArr = self.movieDetailsViewModel.getMovieDetailsData()
                self.cityStr = self.movieDetailsViewModel.getCities()
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
                
            } else {
                print("")
            }
        }
    }
    
    func getCastAndCrewDetailsData() {
        self.movieDetailsViewModel.getCastAndCrewDetails(movieId: movieId) { result in
            if result {
                self.castDataArr = self.movieDetailsViewModel.getCastData()
                self.crewDataArr = self.movieDetailsViewModel.getCrewData()
            } else {
                print("")
            }
        }
    }
    
    func getReviewsData() {
        self.movieDetailsViewModel.getReviewData(movieId: movieId) { result in
            
            if result {
                self.reviewDataArr = self.movieDetailsViewModel.getReviewData()
                self.tblView.reloadData()
            } else {
                print(result)
            }
        }
    }
    
    func getSimilarMoviesData() {
        self.movieDetailsViewModel.getSimilartMoviesData(movieId: movieId) { result in
            if result {
                self.similartResultArr = self.movieDetailsViewModel.getSimilarMoviesData()
                print(result)
            } else {
                print(result)
            }
        }
    }
    
    
    // MARK: -  IBActions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return reviewHeaderArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 {
            if reviewDataArr.count > 0 {
                return isViewAllReview ? reviewDataArr.count : 1
            } else {
                return 0
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tblView.dequeueReusableCell(withIdentifier: "MovieDetailTableViewCell", for: indexPath) as! MovieDetailTableViewCell
            cell.titleLbl.text = self.movieDetailsArr?.originalTitle
            cell.descTitleLbl.text = self.movieDetailsArr?.overview
            cell.dateLbl.text = self.movieDetailsArr?.releaseDate
            cell.cityLbl.text = self.cityStr
            
            let backImgEndURL = movieDetailsArr?.backdropPath ?? ""
            let posterImgEndURL = movieDetailsArr?.posterPath ?? ""
            let imgBaseURL = "https://image.tmdb.org/t/p/original/"
            let backImgURL = imgBaseURL + backImgEndURL
            let posterImgURL = imgBaseURL + posterImgEndURL
            cell.backImg.sd_setImage(with: URL(string: backImgURL), placeholderImage: UIImage(named: "User.png"))
            cell.backImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cell.posterImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cell.posterImg.sd_setImage(with: URL(string: posterImgURL), placeholderImage: UIImage(named: "User.png"))
        
           // cell.cityLbl.text = self.movieDetailsArr
            
            return cell
        } else if indexPath.section == 1 {
            let cell = tblView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as! CastTableViewCell
            
            cell.registerCastMovieDetailsCollectionView(dataInfo: self.castDataArr)
            cell.movieCollectionView.reloadData()
            return cell
        } else if indexPath.section == 2 {
            let cell = tblView.dequeueReusableCell(withIdentifier: "CrewTableViewCell", for: indexPath) as! CrewTableViewCell
            cell.registerCrewMovieDetailsCollectionView(dataInfo: self.crewDataArr)
            cell.crewCollectionView.reloadData()
            return cell
        } else if indexPath.section == 3 {
            
            let cell = tblView.dequeueReusableCell(withIdentifier: "ReviewDetailsTableViewCell", for: indexPath) as! ReviewDetailsTableViewCell
            
            if reviewDataArr.count == 1 {
                cell.viewAllReviewsBtn.isHidden = true
            } else {
                cell.viewAllReviewsBtn.isHidden = false
            }
            
            if isViewAllReview {
                cell.viewAllReviewsBtn.isHidden = true
            } else {
                cell.viewAllReviewsBtn.isHidden = false
            }
           
            
            cell.viewAllReviewsBtn.addTarget(self, action: #selector(self.handleReview), for: .touchUpInside)
            if reviewDataArr.count > 0 {
                cell.nameLbl.text = reviewDataArr[indexPath.row].author?.uppercased()
                cell.reviewLbl.text = reviewDataArr[indexPath.row].content
                 
                let imgBaseURL = "https://image.tmdb.org/t/p/original/"
                let imgEndPathURL = reviewDataArr[indexPath.row].authorDetails?.avatarPath ?? ""
                let imgURL = imgBaseURL + imgEndPathURL
                cell.imgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
                cell.imgView.sd_setImage(with: URL(string: imgURL), placeholderImage: UIImage(named: "User.png"))
              
            }
            return cell
        } else if indexPath.section == 4 {
            let cell = tblView.dequeueReusableCell(withIdentifier: "SimilarResultsTableViewCell", for: indexPath) as! SimilarResultsTableViewCell
            cell.registerMovieDetailsCollectionView(dataInfo: self.similartResultArr)
            cell.similarResultCollectionView.reloadData()
            return cell
        }  else {
            let cell = tblView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as! CastTableViewCell
            
            return cell
        }
    }
    
    @objc func handleReview(){
        
        self.isViewAllReview = true
        
        self.tblView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MovieDetailsHeaderView.loadHeaderView() as! MovieDetailsHeaderView
        header.titleLbl.text = reviewHeaderArr[section]
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else if section == 3 {
            if reviewDataArr.count > 0 {
                return 60
            } else {
                return 0
            }
        } else {
            return 60
        }
    }
    
    
}
