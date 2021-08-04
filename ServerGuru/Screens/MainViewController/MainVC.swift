//
//  ViewController.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 11/6/20.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa



class MainVC: UIViewController,ViewModelBased,StoryboardBased {
	
	
	
	var viewModel: MainVCM!
	
	let disposeBag = DisposeBag()
	
	
	@IBAction func loginPressed(_ sender: Any) {
		
		coordinator?.eventOccured(with: .login)
	}
	
	@IBAction func continueAsGuestPressed(_ sender: Any) {
		coordinator?.eventOccured(with: .continueAsGuest)
	}
	@IBOutlet weak var dynamicCollectionView: DynamicCollectionView!
	
	
	var coordinator: MainCoordinator?
			
		
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//view.backgroundColor = .systemPink
		
		viewModel.viewModelStateObservable().subscribe { [self] (holderModels) in
			dynamicCollectionView.pushImmutableList(holderModels: holderModels)
		}.disposed(by: disposeBag)
			
		viewModel.setScreenState()
		}
	
	

		// Do any additional setup after loading the view.
	}
	
	
