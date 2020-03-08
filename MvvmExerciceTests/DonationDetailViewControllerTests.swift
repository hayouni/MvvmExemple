//
//  DonationDetailViewControllerTests.swift
//  MvvmExerciceTests
//
//  Created by hayouni on 31/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//


import XCTest
@testable import MvvmExercice

class DonationDetailViewControllerTests: XCTestCase {
    var donationDetailViewController: MvvmExercice.DonationDetailViewController!
    var donationListMock: [DonationDetail]?
    
    struct K {
        static let donationDetailViewController = "DonationDetailViewController"
        static let id = "5dc2a2267b0c5d0012185b12"
        static let donationPicturesDetailTableViewCell = "DonationPicturesDetailTableViewCell"
        static let donationInformationDetailTableViewCell = "DonationInformationDetailTableViewCell"
        static let donationPositionDetailTableViewCell = "DonationPositionDetailTableViewCell"
    }
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let instance = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: K.donationDetailViewController) as? MvvmExercice.DonationDetailViewController)!
        
        instance.loadView()
        instance.viewModel = DonationDetailViewModel(id: K.id)
        instance.viewDidLoad()
        donationDetailViewController = instance
        
        if let path = Bundle.main.path(forResource: "DonationDetailMock", ofType: "json") {
            do {
                let donations = try JSONDecoder().decode(DonationDetail.self, from: (Data(contentsOf: URL(fileURLWithPath: path))))
                self.donationListMock = [donations]
            } catch _ {
                // error parse json
            }
        }
        
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDonationPicturesDetailTableViewCell() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        donationDetailViewController.registerTableViewCells()
        donationDetailViewController.tableView.reloadData()
        XCTAssertNotNil(donationDetailViewController.viewModel)
        
        let cell: DonationPicturesDetailTableViewCell = (donationDetailViewController.tableView.dequeueReusableCell(withIdentifier: K.donationPicturesDetailTableViewCell) as? DonationPicturesDetailTableViewCell)!
        XCTAssertNotNil(donationDetailViewController.viewModel.donationPicturesTableViewCell)
        let viewModel = DonationDetailViewModel(id: K.id )
        viewModel.items.value = self.donationListMock
        let cellViewModel = viewModel.donationPicturesTableViewCell()
        
        XCTAssertNotNil(cellViewModel.picture)
        cell.viewModel = cellViewModel
        
    }
    func testDonationInformationDetailTableViewCell() {
        
        let cell: DonationInformationDetailTableViewCell = (donationDetailViewController.tableView.dequeueReusableCell(withIdentifier: K.donationInformationDetailTableViewCell) as? DonationInformationDetailTableViewCell)!
        XCTAssertNotNil(donationDetailViewController.viewModel.donationInformationTableViewCell)
        let viewModel = DonationDetailViewModel(id: K.id )
        viewModel.items.value = self.donationListMock
        let cellViewModel = viewModel.donationInformationTableViewCell()
        
        XCTAssertNotNil(cellViewModel.authorFirstName)
        XCTAssertNotNil(cellViewModel.authorPicture)
        XCTAssertNotNil(cellViewModel.donationDescription)
        
        cell.viewModel = cellViewModel
        
    }
    
    func testDonationPositionDetailTableViewCell() {
        
        let cell: DonationPositionDetailTableViewCell = (donationDetailViewController.tableView.dequeueReusableCell(withIdentifier: K.donationPositionDetailTableViewCell) as? DonationPositionDetailTableViewCell)!
        XCTAssertNotNil(donationDetailViewController.viewModel.donationPositionTableViewCell)
        let viewModel = DonationDetailViewModel(id: K.id )
        
        viewModel.items.value = self.donationListMock
        let cellViewModel = viewModel.donationPositionTableViewCell()
        XCTAssertNotNil(cellViewModel.latitude)
        XCTAssertNotNil(cellViewModel.longitude)
        cell.awakeFromNib()
        cell.addRegion(viewModel: cellViewModel)
        
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
