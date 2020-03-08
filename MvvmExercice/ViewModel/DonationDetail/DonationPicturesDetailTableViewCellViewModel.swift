//
//  PicturesDetailTableViewCellViewModel.swift
//  MvvmExercice
//
//  Created by hayouni on 29/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import Foundation

class DonationPicturesDetailTableViewCellViewModel: DonationPicturesDetailTableViewCellViewModelProtocole {
    
    private var dataModel: DonationDetail?
    
    init(dataModel: DonationDetail?) {
        self.dataModel = dataModel
    }
    
    var picture: String? {
        return dataModel?.pictures?.first
    }
   
}
