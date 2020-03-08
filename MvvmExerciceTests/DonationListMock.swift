//
//  DonationListMoc.swift
//  MvvmExercice
//
//  Created by hayouni on 31/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//


class DonationListMock: DonationListMockProtocol {
 
    internal var donation: [Donation]?

    init(donation: [Donation]) {
        self.donation = donation
    }
    
}
