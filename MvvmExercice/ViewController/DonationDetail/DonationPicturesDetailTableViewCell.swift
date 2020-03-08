//
//  DetailTableViewCell.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import UIKit

class DonationPicturesDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var donateDetailImageView: UIImageView!
    private var imageData: Data?
    var viewModel: DonationPicturesDetailTableViewCellViewModelProtocole?{
        didSet{
            guard let picture = viewModel?.picture else {return}
            let imageURL = String(format: imgeBaseURL, picture)
            // get image from url 
            self.donateDetailImageView.imageFromUrl(urlString: imageURL)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
