//
//  RestaurantSelectionVC.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/20/21.
//

import UIKit
import RxSwift
import Reusable
import RxCocoa


class RestaurantSelectionVC: UIViewController, StoryboardBased, ViewModelBased {
	
	var viewModel: RestaurantSelectionVCM!
	var disposeBag = DisposeBag()
	
	@IBOutlet weak var dynamicCollectionView: DynamicCollectionView!
	
	@IBOutlet weak var addNewRestaurantTapped: UIButton!
	
	var coordinator: MainCoordinator?
	
	override func viewDidLoad() {
		
		addNewRestaurantTapped.rx.tap.subscribe { _ in
			self.viewModel.addRestaurantToList()
		}
		.disposed(by: disposeBag)
		
		
		viewModel.viewModelObservable().subscribe { (holderModels) in
			
			self.dynamicCollectionView.pushImmutableList(holderModels: holderModels)
		}
		.disposed(by: disposeBag)
		
		viewModel.setInitalScreenState()
		
		viewModel.presentAlertCallback = { alert in
			self.present(alert, animated: true, completion: nil)
		}
		
		viewModel.navigateToMenuSelectionCallback = {
			print("MENU SELECTION CALLBACK HIT!!")
			self.coordinator?.eventOccured(with: .menuSelection)
			self.dismiss(animated: true)
			
			
		}
	}
}


