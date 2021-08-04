//
//  MenuCellVH.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/27/21.
//

import UIKit

class MenuCellVH: UICollectionViewCell, BaseviewHolder {
	

	@IBOutlet weak var menuNameLabel: UILabel!
	var eventListener: (()->Void)?
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	func bindData(data: BaseViewHolderModel) {
		
		let vm = data as! MenuCellVHM
		
		eventListener = {
			vm.viewTappedEventListener()
		}
		
		let tap = UIGestureRecognizer(target: self, action: #selector(viewTapped))
		self.addGestureRecognizer(tap)
		
		menuNameLabel.text = vm.menuName
		
		
	}
	@objc func viewTapped() {
		eventListener?()
	}

}

struct MenuCellVHM: BaseViewHolderModel {
	
	var menuName: String
	var viewTappedEventListener: ()->Void
	
	func provideNibName() -> String {
		"MenuCellVH"
	}
	
	func provideCellSize() -> CGSize {
		CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15)
	}
	
	func createCustomCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
		collectionView.dequeueReusableCell(withReuseIdentifier: provideNibName(), for: indexPath)
	}
	
	
}
