//
//  MainViewModelProtocole.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import RxSwift
protocol DonationListViewModelProtocol  {
    
    var items:Variable<[Donation]?>  { get }
        
    func numberOfItems() -> Int
    
    func donationListCellIdentifier() -> String
    
    func donationListCellViewModel(index: IndexPath) -> DonationListCollectionViewCellProtocole

    func donationListCellDidSelectItemAtIndex(index: IndexPath)
    
    func fetchData(query: String)

    
}
