//
//  DonationListCollectionViewCellViewModel.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//


import Foundation

class DonationListCollectionViewCellViewModel: DonationListCollectionViewCellProtocole {
    
    
    private var dataModel: Donation
    
    init(dataModel: Donation) {
        self.dataModel = dataModel
    }
    
    var labelName: String? {
        return ""
    }
    
    var picture: String? {
        return ""
    }
    
}
