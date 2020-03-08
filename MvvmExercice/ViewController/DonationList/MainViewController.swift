//
//  ViewController.swift
//  Geev_Test
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import UIKit
import RxSwift

class DonationListViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource,UICollectionViewDelegate, Storyboarded {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var viewModel: MainViewModelProtocol!
    
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewModel.items
            .asObservable()
            .skip(1)
            .subscribe (onNext: { [weak self] (data) in
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }).disposed(by: disposeBag)
    
        
        // Do any additional setup after loading the view.
        let mainListCellNib = UINib(nibName: "DonationCollectionViewCell", bundle: nil)
        collectionView.register(mainListCellNib, forCellWithReuseIdentifier: "DonationCollectionViewCell")
        collectionView.allowsMultipleSelection = true;

        
    }

    // MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.getData(query: searchText)
    }
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "DonationCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)  as? DonationCollectionViewCell
        let cellViewModel = self.viewModel.mainCellViewModel(index: indexPath)
        cell!.configureCell(viewModel: cellViewModel)
        
        return cell!
    }
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.mainCellDidSelectItemAtIndex(index: indexPath )
    }
    
}




