//
//  MainVCM.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/9/21.
//

import Foundation
import RxSwift
import RxCocoa


class MainVCM: ViewModel{
	
	let holderModelStateSubject = BehaviorSubject<[BaseviewHolderModel]>(value: [])
	
	func viewModelStateObservable() -> Observable<[BaseviewHolderModel]> {
		return holderModelStateSubject.asObservable()
	}
	
	func setScreenState() {
		let holderModelsToDisplay:[BaseviewHolderModel] = [
		StandardButtonCellModel()
		
		]
		
		holderModelStateSubject.onNext(holderModelsToDisplay)
	}
	
}
