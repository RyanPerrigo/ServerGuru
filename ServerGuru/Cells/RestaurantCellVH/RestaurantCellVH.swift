//
//  RestaurantCellVH.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/20/21.
//

import UIKit

class RestaurantCellVH: UICollectionViewCell, BaseviewHolder {

	@IBOutlet weak var nameLabel: UILabel!
	var eventListener: (()->Void)?
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	func bindData(data: BaseViewHolderModel) {
		let VM = data as! RestaurantCellVHM
		
		nameLabel.text = VM.restaurantName
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
		self.addGestureRecognizer(tap)
		
		eventListener = {
			VM.viewTappedListener()
		}
	}
	
	@objc func viewTapped() {
		eventListener?()
		print("VIEW TAPPED!!")
	}

}

struct RestaurantCellVHM: BaseViewHolderModel {
	
	var restaurantName: String
	var viewTappedListener: ()->Void
	
	func provideNibName() -> String {
		"RestaurantCellVH"
	}
	
	func provideCellSize() -> CGSize {
		return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)
	}
	
	func createCustomCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
		
		collectionView.dequeueReusableCell(withReuseIdentifier: provideNibName(), for: indexPath)
	}
	
	
}
