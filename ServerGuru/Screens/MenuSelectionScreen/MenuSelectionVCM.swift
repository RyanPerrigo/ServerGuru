//
//  MenuSelectionVCM.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/27/21.
//

import Foundation
import RxSwift



class MenuSelectionVCM: ViewModel {
	
	private var viewState: PublishSubject<[BaseViewHolderModel]> = PublishSubject<[BaseViewHolderModel]>()
	var navigateToMenuCreationCallBack: (()->Void)?
	
	private var viewHolderModels: [BaseViewHolderModel] = []
	
	func stateObservable() -> Observable<[BaseViewHolderModel]> {
		return viewState.asObservable()
	}
	
	func addMenuHolderModel(menuName: String) {
		
		let holderModel = MenuCellVHM(menuName: menuName, backgroundColor: .red, viewTappedEventListener: { [self] in
			navigateToMenuCreationCallBack?()
		})
		
		self.viewHolderModels.append(holderModel)
		
		viewState.onNext(viewHolderModels)
	}
	
}
