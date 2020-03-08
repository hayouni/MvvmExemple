//
//  PositionTableViewCellViewModel.swift
//  MvvmExercice
//
//  Created by hayouni on 29/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import Foundation

class DonationPositionTableViewCellViewModel: DonationPositionTableViewCellViewModelProtocole {
    

    private var dataModel: DonationDetail?
    
    init(dataModel: DonationDetail?) {
        self.dataModel = dataModel
    }
    
    var longitude: Double? {
        return dataModel?.location?.longitude
    }
    
    var latitude: Double? {
        return dataModel?.location?.latitude
    }
   
}
