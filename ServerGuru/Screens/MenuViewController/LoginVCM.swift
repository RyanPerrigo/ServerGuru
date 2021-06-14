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


class LoginVCM: ViewModel {
	
	var loginState: LoginVCState
	var presentAlertCallback: ((UIAlertController) -> Void)?
	var dismissViewCallback: (()->Void)?
	init (loginState: LoginVCState) {
		self.loginState = loginState
	}
	
	
	
	func setEmailText(text: String) {
		loginState.setEmailTextState(text: text)
		print("emailText: \(text)")
	}
	func setPasswordTextState(text: String) {
		loginState.setPasswordTextState(text: text)
		print("passwordText: \(text)")
	}
	
	func LoginOrRegisterUser() {
		
		FirebaseAuth.Auth.auth().signIn(withEmail: loginState.getEmailTextState(), password: loginState.getPasswordTextState()) { [weak self] results, error in
			guard let strongSelf = self else {return}
			
			guard error == nil else {
				
				print("sign in failed showing alert now!")
				strongSelf.showAlert(email: strongSelf.loginState.getEmailTextState(), password: strongSelf.loginState.getPasswordTextState())
				return
			}
			strongSelf.dismissViewCallback!()
			print("login successful \(results?.user.uid)")
		}
		
	}
	func showAlert(email:String, password:String) {
		
		let alert = UIAlertController(title: "Create Account", message: "Would you like to create an account?", preferredStyle: .alert)
		
		alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {  _ in
			
			FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
				
			guard error == nil else {
					print("error logging in")
				return
				}
				print("CREATED NEW USER \(authResult?.description)")
			}
		}))
		
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
			alert.dismiss(animated: true, completion: nil)
		}))
		
		presentAlertCallback!(alert)
	}
}
