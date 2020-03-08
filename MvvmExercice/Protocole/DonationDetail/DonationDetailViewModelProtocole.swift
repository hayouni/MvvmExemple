//
//  DetailViewModelProtocole.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//
import RxSwift

protocol DonationDetailViewModelProtocole {

    
    func getDetailData()    
    
    func donationInformationTableViewCell() -> DonationInformationDetailTableViewCellViewModelProtocole
    
    func donationPositionTableViewCell() -> DonationPositionTableViewCellViewModelProtocole
    
    func donationPicturesTableViewCell() -> DonationPicturesDetailTableViewCellViewModelProtocole

    var items:Variable<[DonationDetail]?>  { get }
}
