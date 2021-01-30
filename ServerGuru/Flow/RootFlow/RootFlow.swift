////
////  RootFlow.swift
////  ServerGuru
////
////  Created by Ryan Perrigo on 11/7/20.
////
//
//import Foundation
//import RxSwift
//import RxFlow
//
//
//class WatchedFlow: Flow {
//	var root: Presentable {
//		return self.rootViewController
//	}
//
//	private let rootViewController = UINavigationController()
//	private let services: AppServices
//
//	init(withServices services: AppServices) {
//		self.services = services
//	}
//
//	func navigate(to step: Step) -> FlowContributors {
//
//		guard let step = step as? Steps else { return .none }
//
//		switch step {
//
//		case .CreateNewRestaurantPressed:
//			return navigateToMovieListScreen()
//		case .GoButtonPressed:
//			return navigateToMovieDetailScreen(with: movieId)
//
//		default:
//			return .none
//		}
//	}
//}
//func walk(_ direction: String, _ distance: Int) -> String {
//	return direction
//}
