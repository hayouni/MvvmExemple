//
//  DonationPicturesDetailTableViewCellViewModelTests.swift
//  MvvmExerciceTests
//
//  Created by hayouni on 31/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//


import XCTest
import Foundation
import RxSwift
@testable import MvvmExercice
class DonationPicturesDetailTableViewCellViewModelTests: XCTestCase {

  
    private var disposeBag = DisposeBag()
    private var viewModel: DonationPicturesDetailTableViewCellViewModelProtocole!
    private var donationDetailViewModel: DonationPicturesDetailTableViewCellViewModel!
    var donationListMock: DonationDetailMock!
    
    override func setUp() {
        
        if let path = Bundle.main.path(forResource: "DonationDetailMock", ofType: "json") {
            do {
                let donations = try JSONDecoder().decode(DonationDetail.self, from: (Data(contentsOf: URL(fileURLWithPath: path))))
                self.viewModel = DonationPicturesDetailTableViewCellViewModel(dataModel: donations)
                
            } catch _ {
                // error parse json
            }
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(self.viewModel.picture)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
