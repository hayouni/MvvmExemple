//
//  Extension.swift
//  MvvmExercice
//
//  Created by hayouni on 01/01/2020.
//  Copyright © 2020 Arkea. All rights reserved.
//
import UIKit

extension UIImageView {
    
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(url: url as URL)
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: .main) { (responce, data, error) in
                if let imageData = data  {
                    self.image = UIImage(data: imageData )
                }
            }
        }
    }
}
