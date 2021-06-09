//
//  StandardButtonCVC.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/9/21.
//

import UIKit

class StandardButtonCVC: UICollectionViewCell, BaseviewHolder {
	
	@IBOutlet weak var labelOne: UILabel!
	@IBOutlet weak var labelTwo: UILabel!
	@IBOutlet weak var labelThree: UILabel!
	
	
	func bindData(data: BaseviewHolderModel) {
		
	}
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}


struct StandardButtonCellModel: BaseviewHolderModel {
	
	
	func provideNibName() -> String {
		"StandardButtonCVC"
	}
	
	func provideCellSize() -> CGSize {
		return CGSize(
			width: UIScreen.main.bounds.width,
			height: UIScreen.main.bounds.height * 0.4)
	}
	
	func createCustomCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
		collectionView.dequeueReusableCell(withReuseIdentifier: provideNibName(), for: indexPath)
	}
	
	
}
