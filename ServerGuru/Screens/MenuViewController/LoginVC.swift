//
//  LoginVC.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/9/21.
//

import UIKit
import Reusable

class LoginVC: UIViewController, ViewModelBased, StoryboardBased, Coordinating {
	
	
	var viewModel: LoginVCM!
	

	
	
	@IBOutlet weak var emailTextField: UITextField!
	
	@IBOutlet weak var passwordTextField: UITextField!
	
	var coordinator: Coordinator?
	
	
	@IBAction func enterClicked(_ sender: Any) {
		viewModel.LoginOrRegisterUser()
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		setRightBarButton()

		emailTextField.addTarget(self, action: #selector(emailTextChanged), for: .editingChanged)
		passwordTextField.addTarget(self, action: #selector(passwordTextChanged), for: .editingChanged)
        
		viewModel.presentAlertCallback = { controller in
			self.present(controller, animated: true, completion: nil)
		}
		viewModel.dismissViewCallback = {
			self.dismiss(animated: true, completion: nil)
		}
    }

	
	
	@objc func saveUser() {
		self.navigationController?.popViewController(animated: true)
	}
	func setRightBarButton() {
		let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveUser))
		button.tintColor = UIColor.black
		navigationItem.rightBarButtonItem = button
	
	}

	
	
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
