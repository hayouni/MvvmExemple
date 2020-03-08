//
//  Donation.swift
//  GeevExercice
//  Copyright © 2019 Geev. All rights reserved.
//

import Foundation


public class DonationArrayModel: Decodable {
    
    var ads: [Donation]?
    
}

public class Donation: Decodable {
    
    var _id: String?
    
    var title: String?
    
    var pictures: [String]?
}
