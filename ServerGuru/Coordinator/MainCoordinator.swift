//
//  MainCoordinator.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/7/21.
//





import UIKit

enum Event {
	case appStart
	case login
	case restaurantSelection
}

class MainCoordinator: Coordinator {
	
	
	var childCoordinators: [Coordinator]?
	var navController: UINavigationController
	
	init(navigationController:UINavigationController) {
		self.navController = navigationController
	}
	
	func start() {
		let viewModel = MainVCM()
		let vc = MainVC.instantiate(withViewModel: viewModel)
		vc.coordinator = self
		UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
		UINavigationBar.appearance().shadowImage = UIImage()
		UINavigationBar.appearance().backgroundColor = .clear
		UINavigationBar.appearance().backIndicatorImage = UIImage()
		
		navController.setViewControllers([vc], animated: false)
		
	}
	
	func eventOccured(with type: Event) {
		
		switch type {
		case .appStart:
			
			
			let viewModel = MainVCM()
			let vc = MainVC.instantiate(withViewModel: viewModel)
			vc.coordinator = self
			UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
			UINavigationBar.appearance().shadowImage = UIImage()
			UINavigationBar.appearance().backgroundColor = .clear
			UINavigationBar.appearance().backIndicatorImage = UIImage()
			
			navController.setViewControllers([vc], animated: false)
			
		case .login:
			let child = LoginCoordinator(navigationController: navController)
			childCoordinators?.append(child)
			child.eventOccured(with: .intialStep)
			
		case .restaurantSelection:
			let vm = RestaurantSelectionVM()
			let vc = RestaurantSelectionVC.instantiate(withViewModel: vm)
			vc.navigationItem.title = "Restaurant Selection"
			navController.pushViewController(vc, animated: true)
		
		}
		
		
	}
	
	
}
