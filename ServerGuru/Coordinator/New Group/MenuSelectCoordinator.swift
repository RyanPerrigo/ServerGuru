//
//  MenuSelectCoordinator.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 7/8/21.
//

import UIKit
enum MenuSelectEvents {
	case start
	case navigateToMenuCreation
}



 class MenuSelectCoordinator: Coordinator {
	
	weak var parentCoordinator: MainCoordinator?
	var childCoordinators: [Coordinator]?
	
	var navController: UINavigationController
	
	init (navController: UINavigationController) {
		self.navController = navController
	}
	
	
	
	
	func start() {
		let vm = MenuSelectionVCM()
		let vc = MenuSelectionVC.instantiate(withViewModel: vm)
		vc.coordinator = self
		vc.navigationItem.title = "Menu Selection"
		navController.pushViewController(vc, animated: true)
	}
	
	func eventOccuredWithType(event:MenuSelectEvents) {
		
		switch event {
		case .start:
			start()
		case .navigateToMenuCreation:
			
			//TODO: Create menu creation VC
			print("navigated to Menu Creation")
			
		}
	}
	
	func this() {
		let stuff = ("reality", 88, "1.99")
		
	}
	
	
	
}
