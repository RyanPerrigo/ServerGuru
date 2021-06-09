//
//  ViewHolderModel.swift
//  ServerGuru
//
//  Created by Ryan Perrigo on 6/7/21.
//

import UIKit


protocol BaseviewHolderModel {
	func provideNibName() -> String
	func provideCellSize() -> CGSize
	func createCustomCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}

protocol BaseviewHolder: UICollectionViewCell {
	func bindData(data: BaseviewHolderModel)
}
