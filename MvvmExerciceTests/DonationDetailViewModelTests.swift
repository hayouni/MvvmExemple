//
//  DonationDetailViewModelTests.swift
//  MvvmExerciceTests
//
//  Created by hayouni on 31/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import XCTest
import Foundation
import RxSwift
@testable import MvvmExercice

class DonationDetailViewModelTests: XCTestCase {

    private var disposeBag = DisposeBag()
    private var viewModel: DonationDetailViewModelProtocole!
    private var donationDetailViewModel: DonationDetailViewModel!
    var donationListMock: DonationDetailMock!
    
    override func setUp() {
        self.viewModel = DonationDetailViewModel(id: "5dcc19d3f6bbd500122b61d8")

        if let path = Bundle.main.path(forResource: "DonationDetailMock", ofType: "json") {
            do {
                let donations = try JSONDecoder().decode(DonationDetail.self, from: (Data(contentsOf: URL(fileURLWithPath: path))))
                self.donationListMock = DonationDetailMock(donation :donations)
                self.viewModel.items.value = [donations]
 
            } catch _ {
                // error parse json
            }
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
 
        XCTAssertNotNil(self.viewModel.items.value)

    }
    
    func testNilExample() {
        self.viewModel.getDetailData()
        XCTAssertNotNil(self.viewModel.items.value)
        XCTAssertNotNil(self.viewModel.donationInformationTableViewCell())
        XCTAssertNotNil(self.viewModel.donationPicturesTableViewCell())
        XCTAssertNotNil(self.viewModel.donationPositionTableViewCell())

        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

//func getDetailData()
//
//func donationInformationTableViewCell() -> DonationInformationTableViewCellViewModelProtocole
//
//func donationPositionTableViewCell() -> DonationPositionTableViewCellViewModelProtocole
//
//func donationPicturesTableViewCell() -> DonationPicturesTableViewCellViewModelProtocole
//
//var items:Variable<[DonationDetail]?>  { get }
