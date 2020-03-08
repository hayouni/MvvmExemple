//
//  DonationListCollectionViewCellTests.swift
//  MvvmExerciceTests
//
//  Created by hayouni on 31/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import XCTest
import Foundation
import RxSwift
@testable import MvvmExercice

class DonationListCollectionViewCellTests: XCTestCase {
    var donationListViewCell: MvvmExercice.DonationListCollectionViewCell!
    var donationListMock: DonationListMock!
    var viewModel: DonationListCollectionViewCellViewModel!
    private var disposeBag = DisposeBag()

    
    struct K {
        static let donationListViewController = "DonationListCollectionViewCell"
        static let query = "table"
    }
    override func setUp() {
        
        if let path = Bundle.main.path(forResource: "DonationListMock", ofType: "json") {
            do {
                let donations = try JSONDecoder().decode([Donation].self, from: (Data(contentsOf: URL(fileURLWithPath: path))))
                self.donationListMock = DonationListMock(donation :donations)
                self.viewModel = DonationListCollectionViewCellViewModel(dataModel: donations.first!)
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
        XCTAssertEqual(viewModel.labelName, (self.donationListMock.donation?.first)?.title)
        XCTAssertEqual(viewModel.picture, (self.donationListMock.donation?.first)?.pictures?.first)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
