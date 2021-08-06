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
		
		viewModel.navigateToMenuSelectionCallback = {
			self.coordinator?.eventOccured(with: .menuSelection)
		}
		addNewRestaurantTapped.rx.tap.subscribe { _ in
			self.onRightButtonPressed()
		}
		.disposed(by: disposeBag)
		
		
		viewModel.viewModelObservable().subscribe { (holderModels) in
			
			self.dynamicCollectionView.pushImmutableList(holderModels: holderModels)
		}
		.disposed(by: disposeBag)
		
		viewModel.setInitalScreenState()
	
	}
	
	func onRightButtonPressed() {
		let alert = UIAlertController(title: "Add Restaurant", message: "", preferredStyle: .alert)
		
		alert.addTextField { textField in
			textField.placeholder = "Enter Restaurant Name"
		}
		
		alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [ unowned self] _ in
			let textField = alert.textFields!.first! as UITextField
			if let safeText = textField.text {
				viewModel.addRestaurantToList(name: safeText)
			}
		}))

		self.present(alert, animated: true, completion: nil)
	}
}
