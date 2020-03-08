//
//  InformationTableViewCell.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import UIKit

class DonationInformationDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var donationDetailTitle: UILabel!
    @IBOutlet weak var donationDetailAuthor: UILabel!
    @IBOutlet weak var donationDetailDescription: UILabel!
    private var imageData: Data?
    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    var viewModel: DonationInformationDetailTableViewCellViewModelProtocole?{
        didSet{
            self.donationDetailTitle.text = viewModel?.donationTitle
            self.donationDetailAuthor.text = viewModel?.authorFirstName
            self.donationDetailDescription.text = viewModel?.donationDescription
            if let picture = viewModel?.authorPicture  {
                setProfilePicture(profilePicture: picture)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profilePictureImageView.layer.cornerRadius = 13
    }
    
    /// get profile picture 
    private func setProfilePicture(profilePicture: String) {
        let imageURL = String(format: imgeBaseURL, profilePicture)
        self.profilePictureImageView.imageFromUrl(urlString: imageURL)
        
    }
    
}
