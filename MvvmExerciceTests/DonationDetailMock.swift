//
//  DonationDetailMock.swift
//  MvvmExerciceTests
//
//  Created by hayouni on 31/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//


class DonationDetailMock: DonationDetailMockProtocole {    
    
    internal var donation: DonationDetail?
    
    init(donation: DonationDetail) {
        self.donation = donation
    }
    
}
