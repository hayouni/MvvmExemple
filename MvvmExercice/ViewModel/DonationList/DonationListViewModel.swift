//
//  MainViewModel.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//
import RxSwift

public protocol DonationListViewModelDelegate: class {
    func navigateToDetailPage(data: Donation)
}


class DonationListViewModel: DonationListViewModelProtocol {
    
    
    init(delegate: DonationListViewModelDelegate? ) {
        self.delegate = delegate
    }
    
    struct k {
        static let donationListCellView = "DonationListCollectionViewCell"
    }
    
    var items: Variable<[Donation]?>  = Variable(nil)
    
    public weak var delegate: DonationListViewModelDelegate?
    
    func donationListCellIdentifier() -> String {
        return k.donationListCellView
    }
    
    func numberOfItems() -> Int {
        return items.value?.count ?? 0
    }
    
    // create DonationListCollectionViewCellViewModel
    func donationListCellViewModel(index: IndexPath) -> DonationListCollectionViewCellProtocole {
        let historyCellViewModel = DonationListCollectionViewCellViewModel(dataModel:  (items.value?[index.row])!)
        return historyCellViewModel
    }
    
    // user did select item at index
    func donationListCellDidSelectItemAtIndex(index: IndexPath) {
        self.delegate?.navigateToDetailPage(data: (items.value?[index.row])!)
    }
    
    // fetch Donation List
    func fetchData(query: String) {
        WebServiceManager.sharedInstance.fetchDonationList(query: query) { [weak self] (result) in
            switch result {
            case.success(let companies):
                self?.items.value = companies ?? []
            case.failure(let error):
                print("error \(error)")
            }
        }
    }
}
