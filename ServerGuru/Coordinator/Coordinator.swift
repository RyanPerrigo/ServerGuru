//
//  Coordinator.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/7/21.
//

import UIKit

enum Event {
	case MainViewVC
	case loginVC
}

protocol Coordinator {
	var navController: UINavigationController? {get set}
	
	func start()
	
	func eventOccured(with type: Event)
}

protocol Coordinating {
	var coordinator: Coordinator? {get set}
	
	
	
}


