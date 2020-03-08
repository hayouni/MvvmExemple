//
//  InformationTableViewCellViewModel.swift
//  MvvmExercice
//
//  Created by hayouni on 29/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import Foundation

class DonationInformationDetailTableViewCellViewModel: DonationInformationDetailTableViewCellViewModelProtocole {
 
    private var dataModel: DonationDetail?
    
    init(dataModel: DonationDetail?) {
        self.dataModel = dataModel
    }
    
    var donationTitle: String? {
        return dataModel?.title
    }
    
    var picture: String? {
        return dataModel?.pictures?.first
    }
    
    var donationDescription: String?{
        return dataModel?.description
    }
    
    var authorFirstName: String?{
        return dataModel?.author?.first_name
    }
  
    var authorPicture: String?{
        return dataModel?.author?.picture
    }
    
}
