//
//  DonationListCollectionViewCell.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import UIKit

class DonationListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var donationTitleLabel: UILabel!
    @IBOutlet weak var donationImageView: UIImageView!
    private var imageData: Data?
    
    struct K {
        static let placeHolderImageName = "placeHolder"
    }
    
    var viewModel : DonationListCollectionViewCellProtocole? {
        didSet{
            self.donationTitleLabel.text = viewModel?.labelName
            self.donationImageView.image = UIImage(named: K.placeHolderImageName)
            // get image from url
            guard let picture = viewModel?.picture else {return }
            let imageURL = String(format: imgeBaseURL, picture)
            self.donationImageView.imageFromUrl(urlString: imageURL)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.donationImageView.layer.cornerRadius = 8
    }
    
}


