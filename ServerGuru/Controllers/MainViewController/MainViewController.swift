//
//  ViewController.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 11/6/20.
//

import UIKit
import RxSwift
import RxFlow

class MainViewController: UIViewController {
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var restaurantPicker: UIPickerView!
	@IBAction func addRestaurantPressed(_ sender: Any) {
		if let cleanTitle = titleLabel.text {
		var newRestaurant =	mainViewControllerModel.makeRestaurant(name: cleanTitle, {
				
			})
		}
		
		mainViewControllerModel.addRestaurantPressed()	}
	
	@IBAction func goButtonPressed(_ sender: Any) {
		mainViewControllerModel.goButtonPressed()
		tryIt()
	}
	
	private lazy var mainViewControllerModel: MainViewControllerModel = {
		return MainViewControllerModel()
	}()
	
	func tryIt() {
		let hello = Observable.just("Hello World")
		let bag = DisposeBag()
		let subscription = hello.subscribe { event in
			print(event)
			
		}
	}
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
//		tryIt()
		// Do any additional setup after loading the view.
	}
	
	
	
	


}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource{
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		mainViewControllerModel.restaurantsArray.count
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		mainViewControllerModel.restaurantsArray.count
	}
	
	
	
}
