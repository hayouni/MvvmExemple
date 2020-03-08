//
//  Coordinator.swift
//  MvvmExercice
//
//  Created by hayouni on 28/12/2019.
//  Copyright © 2019 Arkea. All rights reserved.
//

import UIKit

public protocol Coordinator : class {
        
    // All coordinators will be initilised with a navigation controller
    init(navigationController:UINavigationController)
    
    func start()
}
