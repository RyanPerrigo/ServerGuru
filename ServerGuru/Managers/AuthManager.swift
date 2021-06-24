//
//  AuthManager.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/22/21.
//

import Foundation
import FirebaseAuth

enum AuthEvents {
	case loggedIn
	case loggedOut
	case getUser
}

protocol AuthListener: AnyObject {
	func authEventOccured(with eventType: AuthEvents )
}


class AuthManager {
	
	var authListener: AuthListener?
	var showAlertCallback: ((String,String)->Void)?
	var dissmissViewCallBack: (()->Void)?
	
	
	func loginOrRegisterUser(email: String, password: String ) {
		print("LoginOrRegisterUser")
		
		FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] results, error in
			guard let strongSelf = self else {return}
			
			guard error == nil else {
				
				print("sign in failed showing alert now!")
				strongSelf.showAlertCallback?(email,password)
				return
			}
			strongSelf.dissmissViewCallBack?()
			print("login successful \(results?.user.uid)")
		}
	}
	
	func createNewUser(email:String, password: String, completionHandler: (()->Void)?) {
		
		FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
			
			guard error == nil else {
				print("error logging in")
				return
			}
			// navigate to restaurant selection screen
			
			completionHandler?()
			
			print("CREATED NEW USER \(authResult?.description)")
		}
		
	}
	
	func userLoggedIn() {
		authListener?.authEventOccured(with: .loggedIn)
	}
	
}
