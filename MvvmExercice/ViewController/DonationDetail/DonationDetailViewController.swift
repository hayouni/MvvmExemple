//
//  DetailViewController.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import UIKit
import RxSwift


class DonationDetailViewController: UIViewController, Storyboarded, UIScrollViewDelegate {
    
    var viewModel: DonationDetailViewModelProtocole!
    
    @IBOutlet weak var tableView: UITableView!
    private var disposeBag = DisposeBag()
    struct K {
        static let donationPicturesDetailTableViewCell = "DonationPicturesDetailTableViewCell"
        static let donationInformationDetailTableViewCell = "DonationInformationDetailTableViewCell"
        static let donationPositionDetailTableViewCell = "DonationPositionDetailTableViewCell"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getDetailData()
        self.registerTableViewCells()
        
       //observe viewModel.items so we reload tableView when it value change
        self.viewModel.items
            .asObservable()
            .subscribe (onNext: { [weak self] (data) in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }).disposed(by: disposeBag)
        
    }
    
    /// registerTableViewCells
    func registerTableViewCells() {
        let donationPicturesDetailTableViewCellNib = UINib(nibName: K.donationPicturesDetailTableViewCell, bundle: nil)
        tableView.register(donationPicturesDetailTableViewCellNib, forCellReuseIdentifier:  K.donationPicturesDetailTableViewCell)
        let donationInformationDetailTableViewCellNib = UINib(nibName: K.donationInformationDetailTableViewCell, bundle: nil)
        tableView.register(donationInformationDetailTableViewCellNib, forCellReuseIdentifier: K.donationInformationDetailTableViewCell)
        let donationPositionDetailTableViewCellNib = UINib(nibName: K.donationPositionDetailTableViewCell, bundle: nil)
        tableView.register(donationPositionDetailTableViewCellNib, forCellReuseIdentifier: K.donationPositionDetailTableViewCell)
    }
}


extension DonationDetailViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: DonationPicturesDetailTableViewCell = (tableView.dequeueReusableCell(withIdentifier: K.donationPicturesDetailTableViewCell) as? DonationPicturesDetailTableViewCell)!
            // create donationPicturesTableViewCell view model
            let cellViewModel = self.viewModel.donationPicturesTableViewCell()
            cell.viewModel = cellViewModel
            return cell
        case 1:
            let cell: DonationInformationDetailTableViewCell = (tableView.dequeueReusableCell(withIdentifier: K.donationInformationDetailTableViewCell) as? DonationInformationDetailTableViewCell)!
            // create donationInformationTableViewCell view model
            let cellViewModel = self.viewModel.donationInformationTableViewCell()
            cell.viewModel = cellViewModel
            return cell
        default:
            let cell: DonationPositionDetailTableViewCell = (tableView.dequeueReusableCell(withIdentifier: K.donationPositionDetailTableViewCell) as? DonationPositionDetailTableViewCell)!
            // create donationPositionTableViewCell view model
            let cellViewModel = self.viewModel.donationPositionTableViewCell()
            cell.addRegion(viewModel: cellViewModel)
            return cell
        }
    }
    
}
