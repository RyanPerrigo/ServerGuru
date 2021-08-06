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
	@IBOutlet weak var topLevelView: UIView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	func bindData(data: BaseViewHolderModel) {
		let vm = data as! MenuCellVHM
		menuNameLabel.text = vm.menuName
		topLevelView.backgroundColor = vm.backgroundColor
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
		self.addGestureRecognizer(tap)
		
		eventListener = {
			vm.viewTappedEventListener()
		}
		
		
	}
	@objc func viewTapped() {
		print("viewTapped")
		eventListener?()
	}

}

struct MenuCellVHM: BaseViewHolderModel {
	
	var menuName: String
	var backgroundColor: UIColor
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
