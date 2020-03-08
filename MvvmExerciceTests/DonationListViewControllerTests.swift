//
//  DonationListViewControllerTests.swift
//  MvvmExerciceTests
//
//  Created by hayouni on 31/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import XCTest
@testable import MvvmExercice

class DonationListViewControllerTests: XCTestCase {
    var donationListViewController: MvvmExercice.DonationListViewController!
   
    struct K {
        static let donationListViewController = "DonationListViewController"
        static let query = "table"
    }
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let instance = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: K.donationListViewController) as? MvvmExercice.DonationListViewController)!
        
        instance.loadView()
        instance.viewModel = DonationListViewModel(delegate: nil)
        instance.viewDidLoad()

        donationListViewController = instance
    
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchDonation() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        donationListViewController.collectionView.reloadData()
        donationListViewController.searchBar.text = "table"
        XCTAssertNotNil(donationListViewController.viewModel.numberOfItems())
    }
    
    func testClickDonation() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        donationListViewController.collectionView(donationListViewController.collectionView, didSelectItemAt: IndexPath(row: 1, section: 1))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
