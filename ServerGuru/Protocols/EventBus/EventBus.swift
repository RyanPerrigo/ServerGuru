//
//  EventBus.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/24/21.
//

import Foundation


struct EventBusEvent {
	var name: String
	var event: Any
}


class EventBus {
	
	private static var sharedInstance = {
		EventBus()
	}()
	
class func Instance() -> EventBus{
		return sharedInstance
	}
	
	typealias EventListener = (EventBusEvent)->Void

	private var listeners: [String:EventListener] = [:]
	// class needs a way to add active listeners
	func addEventListener(identifier:String, eventListener: @escaping EventListener) {
		listeners[identifier] = eventListener
	}
	func removeListener(identifier:String) {
		listeners.removeValue(forKey: identifier)
	}
	func broadcastEventToAllListeners(event: EventBusEvent) {
		listeners.values.forEach { eventListenerCallback in
			eventListenerCallback(event)
		}
	}
	func broadcastSingleEvent(identifier:String,event:EventBusEvent) {
		if let safeListener = listeners[identifier] {
			safeListener(event)
		}
	}
}
