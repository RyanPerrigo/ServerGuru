//
//  UserManager.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 7/12/21.
//

import Foundation
import FirebaseAuth

struct UserManagerState {
	var user: User?
	var userAuthToken: String?
}

class UserManager {
	
	private var userState: UserManagerState
	
	init (userState:UserManagerState){
		self.userState = userState
	}
	
	func saveUser(user:User){
		print("---SAVED USER TO USER MANAGER---")
		userState.user = user
	}
	
	func getUserID() {
		userState.user?.getIDToken(completion: { authToken, error in
			
			guard error == nil else {print("error getting auth token");return}
			self.userState.userAuthToken = authToken
		
		})
	}
}
