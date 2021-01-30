//
//  Restaurant.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 11/6/20.
//

import UIKit


protocol FoodItem {
	var name: String {get}
	var price: Int? {get}
}
protocol DrinkItem {
	var name: String {get}
	var price: Int? {get}
}
class Restaruant {
	var name: String = ""
	var menuItems: [MenuItem] = []
}

struct MenuItem: FoodItem, DrinkItem {
	var name: String
	var description: String?
	var price: Int?
}
