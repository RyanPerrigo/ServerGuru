//
//  MainViewControllerModel.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 11/6/20.
//

import Foundation


protocol MainViewControllerEventsDelegate {
	func addRestaurantPressed()
	func goButtonPressed()
}


class MainViewControllerModel {
	
	
	var restaurantsArray: [Restaruant] = []
	
	var currentMenuItems: [MenuItem] = []
	
	private lazy var mainViewController: MainViewController = {
		return MainViewController()
	}()
	
	func makeRestaurant(name:String, _:()->Void) -> Restaruant {
		let restaurant = Restaruant()
		restaurant.name = name
		
	}
	
	func makeRestaurantArrayForTicker() -> [Restaruant] {
		return restaurantsArray
	}
//	func getCurrentRestaruant(new) -> Restaurant {
//		
//	}
//	
	
	
	
	
	
	
}

extension MainViewControllerModel: MainViewControllerEventsDelegate {
	
	
	func addRestaurantPressed() {
		
		// do something
		print("add button pressed")
	}
	
	func goButtonPressed() {
	
		print(restaurant)
		
	}
}
