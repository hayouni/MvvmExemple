//
//  DonationCoordinator.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import Foundation

import UIKit

class DonationCoordinator: Coordinator {
        
    unowned let navigationController:UINavigationController
    
    // initiate navigationController
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // start DonationCoordinator
    func start() {
        let donationListViewController = DonationListViewController.instantiate()
        donationListViewController.viewModel = DonationListViewModel(delegate: self)
        self.navigationController.viewControllers = [donationListViewController]
    }
}

// DonationListViewModelDelegate
extension DonationCoordinator : DonationListViewModelDelegate {
    // navigate to Detail Page
    func navigateToDetailPage(data: Donation) {
        let detailViewController = DonationDetailViewController.instantiate()
        detailViewController.viewModel = DonationDetailViewModel(id: data._id ?? "")
        self.navigationController.pushViewController(detailViewController, animated: true)
    }
    
}
