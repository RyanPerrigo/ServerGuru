//
//  RestaurantSelectionVCM.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/20/21.
//

import Foundation
import RxSwift
import RxCocoa



class RestaurantSelectionVCM: ViewModel {
	
	
	
	private var viewModelStateSubject = BehaviorSubject<[BaseViewHolderModel]>(value: [])
	var presentAlertCallback: ((UIAlertController)->Void)?
	var navigateToMenuSelectionCallback: (()->Void)?
	func viewModelObservable() -> Observable<[BaseViewHolderModel]> {
		return viewModelStateSubject.asObservable()
	}
	
	var holderModelsToDisplay: [BaseViewHolderModel] = [
	
	]
	
	func setInitalScreenState() {
		
		viewModelStateSubject.onNext(holderModelsToDisplay)
	}
	
	func addRestaurantToList() {
		let alert = UIAlertController(title: "Add Restaurant", message: "", preferredStyle: .alert)
		
		alert.addTextField { textField in
			textField.placeholder = "Enter Restaurant Name"
		}
		
		alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [unowned self] _ in
			let textField = alert.textFields!.first! as UITextField
			if let safeText = textField.text {
				
				let restaurantModel = RestaurantCellVHM(restaurantName: safeText, viewTappedListener: {
				
					navigateToMenuSelectionCallback?()
				})
				holderModelsToDisplay.append(restaurantModel)
				viewModelStateSubject.onNext(holderModelsToDisplay)
			}
			
		}))
		
		presentAlertCallback?(alert)
		
	}
	
}
