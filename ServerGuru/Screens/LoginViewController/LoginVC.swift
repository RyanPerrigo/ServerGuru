//
//  LoginVC.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/9/21.
//

import UIKit
import Reusable
import FirebaseAuth

class LoginVC: UIViewController, ViewModelBased, StoryboardBased {
	
	
	var viewModel: LoginVCM!
	
	
	
	@IBOutlet weak var enterButton: UIButton!
	
	@IBOutlet weak var emailTextField: UITextField!
	
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBAction func enterClicked(_ sender: Any) {
		viewModel.loginPressed()
	}
	
	var coordinator: LoginCoordinator?
	
	
	override func viewWillAppear(_ animated: Bool) {
		
		viewModel.listenForUserStateChange()
		
	}
	override func viewWillDisappear(_ animated: Bool) {
		viewModel.removeListener()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//appendChildCoordinators()
		setRightBarButton()
		
		emailTextField.addTarget(self, action: #selector(emailTextChanged), for: .editingChanged)
		passwordTextField.addTarget(self, action: #selector(passwordTextChanged), for: .editingChanged)
		
		viewModel.presentAlertCallback = { controller in
			self.present(controller, animated: true, completion: nil)
		}
		viewModel.dismissViewCallback = { [self] in
			coordinator?.eventOccured(with: .success)
		}
		
		
		
		enterButton.layer.addBorder(edge: .top, color: UIColor.blue, thickness: 2)
		enterButton.layer.addBorder(edge: .bottom, color: .blue, thickness: 2)
		enterButton.layer.addBorder(edge: .left, color: .blue, thickness: 2)
		enterButton.layer.addBorder(edge: .right, color: .blue, thickness: 2)
		
	}
	
	
	
	@objc func saveUser() {
		self.navigationController?.popViewController(animated: true)
	}
	func setRightBarButton() {
		let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveUser))
		button.tintColor = UIColor.black
		navigationItem.rightBarButtonItem = button
		
	}
	//	func appendChildCoordinators() {
	//		let navController = UINavigationController()
	//		let loginCoordinator = LoginCoordinator(navigationController: navController)
	//		coordinator?.childCoordinators?.append(loginCoordinator)
	//	}
	
	
	@objc func emailTextChanged() {
		
		if let safeText = emailTextField.text {
			viewModel.setEmailText(text: safeText)
		}
	}
	@objc func passwordTextChanged() {
		if let safeText = passwordTextField.text {
			viewModel.setPasswordTextState(text: safeText)
		}
	}
}
