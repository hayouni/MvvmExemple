//
//  PositionTableViewCell.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import UIKit
import MapKit

class DonationPositionDetailTableViewCell: UITableViewCell, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    var circle: MKCircle!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mapView.delegate = self
    }
    
   // add obfuscated position
    func addRegion(viewModel: DonationPositionTableViewCellViewModelProtocole) {
        mapView.delegate = self
        if let latitude = viewModel.latitude , let longitude = viewModel.longitude {
            let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center : center, span : span)
            mapView.setRegion(region, animated: true)
            mapView.showsUserLocation = true
            mapView.addOverlay(MKCircle(center: center, radius: CLLocationDistance(2000)))
        }
        
    }
    
   // cutomise MKCircle
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let overlay = overlay as? MKCircle {
            let circleRenderer = MKCircleRenderer(circle: overlay)
            circleRenderer.fillColor = UIColor.blue
            circleRenderer.alpha = 0.2
            return circleRenderer
        } else {
            return MKOverlayRenderer(overlay: overlay)
        }
    }
    
}
