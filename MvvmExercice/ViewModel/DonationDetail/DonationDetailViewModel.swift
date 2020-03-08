//
//  DetailViewModel.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import Foundation
import RxSwift

class DonationDetailViewModel: DonationDetailViewModelProtocole {
    
    
    var items: Variable<[DonationDetail]?>  = Variable(nil)
    
    var id: String?
    
    init(id: String ) {
        self.id = id
    }
    
    // create DonationInformationTableViewCellViewModelProtocole
    func donationInformationTableViewCell() -> DonationInformationDetailTableViewCellViewModelProtocole {
        let donationInformationDetailTableViewCellViewModel = DonationInformationDetailTableViewCellViewModel(dataModel:  items.value?.first ?? nil)
        return donationInformationDetailTableViewCellViewModel
    }
    
    // create DonationPositionTableViewCellViewModelProtocole
    func donationPositionTableViewCell() -> DonationPositionTableViewCellViewModelProtocole {
        let donationPositionTableViewCellViewModel = DonationPositionTableViewCellViewModel(dataModel:  items.value?.first ?? nil)
        return donationPositionTableViewCellViewModel
    }
    
    // create DonationPicturesTableViewCellViewModelProtocole
    func donationPicturesTableViewCell() -> DonationPicturesDetailTableViewCellViewModelProtocole {
        let donationPicturesDetailTableViewCellViewModel = DonationPicturesDetailTableViewCellViewModel(dataModel:  items.value?.first ?? nil)
        return donationPicturesDetailTableViewCellViewModel
    }
    
    // fetch Donation detail
    func getDetailData() {
        WebServiceManager.sharedInstance.fetchDonationDetail(id: id ?? "" ) { [weak self] (result) in
            switch result {
            case.success(let companies):
                self?.items.value = companies ?? []
            case.failure(let error):
                print("error \(error)")
            }
        }
    }
    
}
