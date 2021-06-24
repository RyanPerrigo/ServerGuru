//
//  Coordinator.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/7/21.
//

import UIKit

protocol Coordinator {
	var childCoordinators: [Coordinator]? {get set}
	var navController: UINavigationController {get set}
	
	func start()
}




