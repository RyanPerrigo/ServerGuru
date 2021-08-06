//
//  RestaurantSelectionVCM.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/20/21.
//

import Foundation
import RxSwift


class RestaurantSelectionVCM: ViewModel {
	
	
	private var viewModelStateSubject = BehaviorSubject<[BaseViewHolderModel]>(value: [])
	var presentAlertCallback: (()->Void)?
	var navigateToMenuSelectionCallback: (()->Void)?
	func viewModelObservable() -> Observable<[BaseViewHolderModel]> {
		return viewModelStateSubject.asObservable()
	}
	
	var holderModelsToDisplay: [BaseViewHolderModel] = [
	
	]
	
	func setInitalScreenState() {
		
		viewModelStateSubject.onNext(holderModelsToDisplay)
	}
	
	func addRestaurantToList(name:String) {
		
		let restaurantHolderModel = RestaurantCellVHM(restaurantName: name, viewTappedListener: {
			self.navigateToMenuSelectionCallback?()
		})
		holderModelsToDisplay.append(restaurantHolderModel)
		viewModelStateSubject.onNext(holderModelsToDisplay)
		}
}
