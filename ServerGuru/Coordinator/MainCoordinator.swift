//
//  MainCoordinator.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/7/21.
//





import UIKit

enum MainCoordinatorEvents {
	case appStart
	case login
	case menuSelection
	case continueAsGuest
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
	
	func eventOccured(with type: MainCoordinatorEvents) {
		
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
			child.parentCoordinator = self
			childCoordinators?.append(child)
			child.eventOccured(with: .intialStep)
			
		case .menuSelection:
			let child = MenuSelectCoordinator(navController: navController)
			let vm = MenuSelectionVCM()
			let vc = MenuSelectionVC.instantiate(withViewModel: vm)
			vc.navigationItem.title = "Menu Selection"
			vc.coordinator = child
			navController.setViewControllers([vc], animated: true)
			
			
//			let child = MenuSelectCoordinator(navController: navController)
//			childCoordinators?.append(child)
//			child.start()
		case .continueAsGuest:
			let child = LoginCoordinator(navigationController: navController)
			
			child.parentCoordinator = self
			childCoordinators?.append(child)
			child.eventOccured(with: .success)
		}
		
		
	}
	
	
}
