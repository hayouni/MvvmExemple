//
//  InformationTableViewCellProtocole.swift
//  MvvmExercice
//
//  Created by hayouni on 29/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//


import Foundation

protocol DonationInformationDetailTableViewCellViewModelProtocole {
    
    var donationTitle: String? { get}
    
    var donationDescription: String? {get}
    
    var authorFirstName: String? {get}
    
    var authorPicture: String? {get}
}
