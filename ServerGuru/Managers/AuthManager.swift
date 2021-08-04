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


class AuthManager {
	
	private var userManager: UserManager
	
	init(userManager:UserManager) {
		self.userManager = userManager
	}
	
	func loginOrRegisterUser(
		email: String,
		password: String,
		showAlertCallback: ((String, String) -> Void)?,
		dismissViewCallBack:(()->Void)?
		
	){
		print("LoginOrRegisterUser")
		
		FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] results, error in
			guard let strongSelf = self else {return}
			
			guard error == nil else {
				
				print("sign in failed showing alert now!")
				showAlertCallback?(email,password)
				
				return
			}
			
			guard let safeResults: AuthDataResult = results else {return}
			
			
			let passUserToUserManagerEvent = EventBusEvent(
				name: "passUserToUserManager",
				event: safeResults.user
			)
			
			EventBus.Instance().broadcastEventToAllListeners(event: passUserToUserManagerEvent)
			dismissViewCallBack?()
			
			let myUser: User = safeResults.user
			
			strongSelf.userManager.saveUser(user: myUser)
			
			// pass user to UserManager
			/*
			injectedUserManager.saveUser(user: User) {
			userDefaultsManager.saveEmail
			}
			*/
			print("login successful \(results?.user.uid)")
		}
	}
	func removeEventListner(){
		
	}
	func onLoginStateChange() {
		EventBus.Instance().addEventListener(identifier: Constants.loginStateChanged) { EventBusEvent in
			print("LOGIN STATE CHANGED")
			// this is where im trying to "handle???" the event that is defined on line 44
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
	
	func getLoggedInUser(user:User) {
		
	}
	
}
