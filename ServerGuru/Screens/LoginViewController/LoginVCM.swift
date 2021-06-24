//
//  LoginVCM.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/9/21.
//

import Foundation
import FirebaseAuth


struct LoginVCState {
	
	private var emailTextState: String = ""
	private var passwordTextState: String = ""
	
	
	mutating func setEmailTextState(text: String) {
		emailTextState = text
	}
	mutating func setPasswordTextState(text: String) {
		passwordTextState = text
	}
	
	func getEmailTextState() -> String {
		return emailTextState
	}
	func getPasswordTextState() -> String {
		passwordTextState
	}
}


class LoginVCM: ViewModel, AuthListener {
	
	var authManager: AuthManager
	var loginState: LoginVCState
	var presentAlertCallback: ((UIAlertController) -> Void)?
	var dismissViewCallback: (()->Void)?
	var stateChangeListener:((Auth,User?)->Void)?
	
	init (loginState: LoginVCState,authManager: AuthManager) {
		self.loginState = loginState
		self.authManager = authManager
	}
	
	func loginPressed() {
		authManager.showAlertCallback = { email, password in
			
			self.showAlert(email: email, password: password)
		}
		authManager.dissmissViewCallBack = dismissViewCallback
		
		authManager.loginOrRegisterUser(email: loginState.getEmailTextState(),password: loginState.getPasswordTextState())
	}
	
	func showAlert(email:String, password:String) {
		
		let alert = UIAlertController(title: "Create Account", message: "Would you like to create an account?", preferredStyle: .alert)
		
		alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { [self]  _ in
			
			authManager.createNewUser(email: loginState.getEmailTextState(), password: loginState.getPasswordTextState(), completionHandler: nil)
			
		}))
		
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
			alert.dismiss(animated: true, completion: nil)
		}))
		
		presentAlertCallback!(alert)
	}
	func setEmailText(text: String) {
		loginState.setEmailTextState(text: text)
		print("emailText: \(text)")
	}
	func setPasswordTextState(text: String) {
		loginState.setPasswordTextState(text: text)
		print("passwordText: \(text)")
	}
	func authEventOccured(with eventType: AuthEvents) {
		
		switch eventType {
		
		case .loggedOut:
			
			
		break
		default:
			return
		}
	}
}
