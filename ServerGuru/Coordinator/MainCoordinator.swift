//
//  MainCoordinator.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/7/21.
//

import UIKit

class MainCoordinator: Coordinator {
	
	
	
	var navController: UINavigationController?
	
	func start() {
		
		var vc: UIViewController & Coordinating = MainViewController()
		vc.coordinator = self
		UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
		UINavigationBar.appearance().shadowImage = UIImage()
		UINavigationBar.appearance().backgroundColor = .clear
		UINavigationBar.appearance().backIndicatorImage = UIImage()
		
		navController?.setViewControllers([vc], animated: false)
		
	}
	
	func eventOccured(with type: Event) {
		
		switch type {
		case .MainViewVC:
			print("go there")
		case .loginVC:
			print("Logged in!!")
		}
	}
	
	
}
