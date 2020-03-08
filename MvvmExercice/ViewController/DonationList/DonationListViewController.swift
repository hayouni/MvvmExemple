//
//  ViewController.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DonationListViewController: UIViewController, UISearchBarDelegate, Storyboarded {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var viewModel: DonationListViewModelProtocol!

    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        // Do any additional setup after loading the view.

        self.searchBar.rx.text
            .orEmpty
            .subscribe(onNext: {query in
                self.viewModel.fetchData(query: query)
            }).disposed(by: disposeBag)

        self.viewModel.items
            .asObservable()
            .subscribe (onNext: { [weak self] (data) in
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }).disposed(by: disposeBag)
    }
    
    /// register cell before use it
    func registerCell()  {
        let donationListCellNib = UINib(nibName: self.viewModel.donationListCellIdentifier(), bundle: nil)
        collectionView.register(donationListCellNib, forCellWithReuseIdentifier: self.viewModel.donationListCellIdentifier())
    }
    
}

// MARK: - UICollectionViewDataSource
extension DonationListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.viewModel.donationListCellIdentifier(), for: indexPath)  as! DonationListCollectionViewCell
        // create cell view model
        let cellViewModel = self.viewModel.donationListCellViewModel(index: indexPath)
        cell.viewModel =  cellViewModel
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate
extension DonationListViewController: UICollectionViewDelegate {
    
    // user select donation at index
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.donationListCellDidSelectItemAtIndex(index: indexPath )
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DonationListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width / 2, height: self.view.frame.size.width / 2);
    }
}
