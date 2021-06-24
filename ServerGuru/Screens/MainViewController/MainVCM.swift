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
	
	let holderModelStateSubject = BehaviorSubject<[BaseViewHolderModel]>(value: [])
	
	func viewModelStateObservable() -> Observable<[BaseViewHolderModel]> {
		return holderModelStateSubject.asObservable()
	}
	
	func setScreenState() {
		let holderModelsToDisplay:[BaseViewHolderModel] = [
		WelcomeScreenVHM()
		]
		
		holderModelStateSubject.onNext(holderModelsToDisplay)
	}
	
}
