//
//  ViewController.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 11/6/20.
//

import UIKit
import Reusable



class MainViewController: UIViewController, Coordinating, StoryboardBased {
	
	@IBOutlet weak var dynamicCollectionView: DynamicCollectionView!
	
	
	var coordinator: Coordinator?
	
	
	private lazy var mainVCM: MainVCM = {
		return MainVCM()
	}()
				
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//view.backgroundColor = .systemPink
		dynamicCollectionView.pushImmutableList(holderModels: mainVCM.holderModels)
		
		

		// Do any additional setup after loading the view.
	}
	
	
	
	
	
}
