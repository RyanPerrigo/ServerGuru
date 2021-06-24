//
//  LoginCoordinator.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/9/21.
//

import UIKit


enum LoginEvents {
	case intialStep
	case success
	case error
}

class LoginCoordinator: Coordinator {
	
	weak var parentCoordinator: MainCoordinator?
	var childCoordinators: [Coordinator]?
	var navController: UINavigationController
	
	
	
	init (navigationController: UINavigationController) {
		self.navController = navigationController
	}

	func start() {
		
	}

	func eventOccured(with type: LoginEvents) {
		switch type {
		case .success:
			goToRestaurantSelectionVC()
		case .error:
			print("error logging in")
		case .intialStep:
			goToLoginVC()
		}
	}


	private func goToLoginVC() {
		let authManager = AuthManager()
		let loginState = LoginVCState()
		let vm = LoginVCM(loginState: loginState, authManager: authManager)
		let vc = LoginVC.instantiate(withViewModel: vm)
		vc.coordinator = self
		vc.navigationItem.title = "Login"
		navController.pushViewController(vc, animated: true)
	}

	private func goToRestaurantSelectionVC() {
		let vm = RestaurantSelectionVM()
		let vc = RestaurantSelectionVC.instantiate(withViewModel: vm)
		vc.coordinator = self
		navController.setViewControllers([vc], animated: true)
		
	}
	
	
	
	
}
