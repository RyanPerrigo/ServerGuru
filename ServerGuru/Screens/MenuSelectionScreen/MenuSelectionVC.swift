//
//  MenuSelectionVC.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/27/21.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable


class MenuSelectionVC: UIViewController,ViewModelBased,StoryboardBased {
	
	@IBOutlet weak var dynamicCollectionView: DynamicCollectionView!
	var viewModel: MenuSelectionVCM!
	var disposeBag = DisposeBag()
	var coordinator: MenuSelectCoordinator?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		print("----- MENU SELECTION VC VIEW DID LOAD! -----")
		viewModel.stateObservable().subscribe { [self] (holderModels) in
			dynamicCollectionView.pushImmutableList(holderModels: holderModels)
		}
		.disposed(by: disposeBag)
        // Do any additional setup after loading the view.
		viewModel.navigateToMenuCreationCallBack = {
			self.coordinator?.eventOccuredWithType(event: .navigateToMenuCreation)
		}
		navigationController?.navigationBar.isHidden = false
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onRightButtonClicked))
		
    }
    
	@objc func onRightButtonClicked() {
		
		let alert = UIAlertController(title: "Select Menu or Add New", message: "Please select a menu or Enter Menu Name here", preferredStyle: .alert)
		
		alert.addTextField { textField in
			textField.placeholder = "Menu Name Here"
		}
		
		alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
			let textField = alert.textFields![0] as UITextField
			if let safeText = textField.text {
				self.viewModel.addMenuHolderModel(menuName: safeText)
			}
		}))
		
		self.present(alert, animated: true, completion: nil)
		
	}
	
	func setRightBarButton() {
		
		let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onRightButtonClicked))
		
		button.tintColor = UIColor.black
		navigationItem.rightBarButtonItem = button
	}
	
	
	
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
