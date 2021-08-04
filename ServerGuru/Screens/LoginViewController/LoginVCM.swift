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
	private var loginState: Bool = false
	
	
	mutating func setEmailTextState(text: String) {
		emailTextState = text
	}
	mutating func setPasswordTextState(text: String) {
		passwordTextState = text
	}
	mutating func changeLoginState() {
		print("loginState is False")
		loginState = !loginState
		print("loginState is now \(loginState)")
	}
	func getEmailTextState() -> String {
		return emailTextState
	}
	func getPasswordTextState() -> String {
		passwordTextState
	}
	
}


class LoginVCM: ViewModel {
	
	var authManager: AuthManager
	var loginState: LoginVCState
	var presentAlertCallback: ((UIAlertController) -> Void)?
	var dismissViewCallback: (()->Void)?
	var stateChangeListener:((Auth,User?)->Void)?
	
	private var handle: AuthStateDidChangeListenerHandle? = nil
	
	init (
		loginState: LoginVCState,
		authManager: AuthManager
	) {
		self.loginState = loginState
		self.authManager = authManager
		
	}
	
	func loginPressed() {

		authManager.loginOrRegisterUser(email: loginState.getEmailTextState(), password: loginState.getPasswordTextState()) { email, password in
			
			self.showAlert(email: email, password: password)
		}
		dismissViewCallBack: {
			self.dismissViewCallback?()
		}
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
	func handleUserStateChange(
		auth:Auth,
		user: User
	){
		
	}
	
	func listenForUserStateChange() {
		
		handle = FirebaseAuth.Auth.auth().addStateDidChangeListener{ auth, user in
			print("FirebaseAuth.Auth.auth().addStateDidChangeListener")
			print("AUTH: \(auth)")
			print("USER: \(user)")
		}
		authManager.onLoginStateChange()
		
	}
	func removeListener() {
		Auth.auth().removeStateDidChangeListener(handle!)
		authManager.removeEventListner()
	}
	
}
