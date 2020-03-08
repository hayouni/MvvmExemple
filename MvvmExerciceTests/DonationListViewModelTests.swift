//
//  DonationListViewModelTests.swift
//  MvvmExerciceTests
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import XCTest
import Foundation
import RxSwift
@testable import MvvmExercice

class DonationListViewModelTests: XCTestCase {
    private var disposeBag = DisposeBag()
    private var viewModel: DonationListViewModelProtocol!
    weak private var _delegate: DonationListViewModelDelegate?
    private var donationListViewModel: DonationListViewModel!
    var donationListMock: DonationListMock!

    override func setUp() {
        self.viewModel = DonationListViewModel(delegate: _delegate)
        if let path = Bundle.main.path(forResource: "DonationListMock", ofType: "json") {
            do {
                let donations = try JSONDecoder().decode([Donation].self, from: (Data(contentsOf: URL(fileURLWithPath: path))))
                self.donationListMock = DonationListMock(donation :donations)
                self.viewModel.items.value = donations
            } catch _ {
                // error parse json
            }
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {

        XCTAssertEqual(self.viewModel.numberOfItems(), 2)
        XCTAssertEqual(self.viewModel.donationListCellIdentifier(), "DonationListCollectionViewCell")
        XCTAssertNotNil(self.viewModel.donationListCellViewModel(index: IndexPath(row: 1, section: 1)))
        XCTAssertNotEqual(self.viewModel.donationListCellIdentifier(), "DonationListCollectionView")

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
