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



class MainVC: UIViewController, Coordinating,ViewModelBased, StoryboardBased {
	
	
	var viewModel: MainVCM!
	let disposeBag = DisposeBag()
	
	
	@IBAction func loginPressed(_ sender: Any) {
		let vm = LoginVCM(loginState: LoginVCState())
		let vc = LoginVC.instantiate(withViewModel: vm)
		vc.navigationItem.title = "Login"
		coordinator?.navController?.pushViewController(vc, animated: true)
	}
	
	@IBAction func registerPressed(_ sender: Any) {
	}
	@IBOutlet weak var dynamicCollectionView: DynamicCollectionView!
	
	
	var coordinator: Coordinator?
			
		
	
	
	
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
	
	
