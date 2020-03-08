//
//  Constant.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

let bordeauxLocation: [Double] = [44.837789, -0.5791799999999512]

let donationListbaseUrl = "https://stage.geev.fr/api/v0.19/items?location=\(bordeauxLocation[0]),\(bordeauxLocation[1])&type=donation&presentation=summary&distance=50000&keywords="

let donationDetailbaseUrl =
"https://stage.geev.fr/api/v0.19/items?_id=%@&presentation=full"

 let imgeBaseURL = "https://stage-images.geev.fr/%@/squares/300"


