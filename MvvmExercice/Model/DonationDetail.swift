//
//  DonationDetail.swift
//  MvvmExercice
//
//  Created by hayouni on 29/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//


public class  DonationDetailModel: Decodable {
    
    var ads: [DonationDetail]?
    
}

public class  DonationDetail: Decodable {
    
    var _id: String?
    
    var title: String?
    
    var description: String?
    
    var pictures: [String]?
    
    var author: DonationAuthor?
    
    var location: DonationLocation?
    
}

public class  DonationAuthor: Decodable {
    
    var _id: String?
    
    var first_name: String?
    
    var last_name: String?
    
    var picture: String?
}

public class  DonationLocation: Decodable {
    
    var longitude: Double?
    
    var latitude: Double?
}

