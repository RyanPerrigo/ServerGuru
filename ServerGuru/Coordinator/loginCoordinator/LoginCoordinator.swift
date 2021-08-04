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
		let userManager = UserManager(userState: UserManagerState())
		let authManager = AuthManager(userManager: userManager)
		let loginState = LoginVCState()
		let vm = LoginVCM(loginState: loginState, authManager: authManager)
		let vc = LoginVC.instantiate(withViewModel: vm)
		vc.coordinator = self
		vc.navigationItem.title = "Login"
		navController.pushViewController(vc, animated: true)
	}

	private func goToRestaurantSelectionVC() {
		//navController.popViewController(animated: true)
		let vm = RestaurantSelectionVCM()
		
		let vc = RestaurantSelectionVC.instantiate(withViewModel: vm)
		
		vc.coordinator = parentCoordinator
		navController.setViewControllers([vc], animated: true)
	}
	private func goToMenuSelectionCoordinator() {
		parentCoordinator?.eventOccured(with: .menuSelection)
	}
	
	
	
	
}
