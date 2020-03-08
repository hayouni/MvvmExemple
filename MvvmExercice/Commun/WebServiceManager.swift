//
//  WebServiceManager.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import Foundation


public class WebServiceManager: NSObject {
    
    static let sharedInstance = WebServiceManager()
    
    func fetchDonationList(query: String ,completion: @escaping (Result<[Donation]?, Error>) ->())  {
        
        guard let url = URL(string: donationListbaseUrl + query) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let donationArray = try JSONDecoder().decode(DonationArrayModel.self, from: data!)
                completion (.success(donationArray.ads))
            } catch let JsonError {
                completion(.failure(JsonError))
            }
            
            }.resume()
    }
    
    
    func fetchDonationDetail(id: String ,completion: @escaping (Result<[DonationDetail]?, Error>) ->())  {
        let baseUrl = String(format: donationDetailbaseUrl, id)
        guard let url = URL(string:baseUrl ) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let donationDetail = try JSONDecoder().decode(DonationDetailModel.self, from: data!)
                completion (.success(donationDetail.ads))
            } catch let JsonError {
                completion(.failure(JsonError))
            }
            
            }.resume()
    }
    
}

