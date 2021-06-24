//
//  StandardButtonCVC.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/9/21.
//

import UIKit

class WelcomeScreenVH: UICollectionViewCell, BaseviewHolder {
	
	@IBOutlet weak var labelOne: UILabel!
	@IBOutlet weak var labelTwo: UILabel!
	@IBOutlet weak var labelThree: UILabel!
	
	
	func bindData(data: BaseViewHolderModel) {
		
	}
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}


struct WelcomeScreenVHM: BaseViewHolderModel {
	
	
	func provideNibName() -> String {
		"WelcomeScreenVH"
	}
	
	func provideCellSize() -> CGSize {
		return CGSize(
			width: UIScreen.main.bounds.width,
			height: UIScreen.main.bounds.height)
	}
	
	func createCustomCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
		collectionView.dequeueReusableCell(withReuseIdentifier: provideNibName(), for: indexPath)
	}
	
	
}
