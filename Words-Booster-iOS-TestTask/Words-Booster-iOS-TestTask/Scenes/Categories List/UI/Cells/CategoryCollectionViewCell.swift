//
//  CategoryCollectionViewCell.swift
//  Words-Booster-iOS-TestTask
//
//  Created by Dmitriy Dmitriyev on 10.06.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static func nib() -> UINib {
        return UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
    }
    
    static let reuseIdentifier = "CategoryCollectionViewCell"

    @IBOutlet private weak var categoryImageView: UIImageView!
    @IBOutlet private weak var categoryTitle: UILabel!
    @IBOutlet private weak var categorySubtitle: UILabel!
    @IBOutlet private weak var premiumView: UIView!
    @IBOutlet private weak var comingSoonImageView: UIImageView!
    @IBOutlet private weak var overlayView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(with category: Category) {
        categoryTitle.text = category.title
        categorySubtitle.text = category.description
        
        premiumView.isHidden = category.status == .free
        categoryImageView.downloaded(from: category.image)
        
        if (category.content ?? []).isEmpty {
            showComingSoonFlow()
        }
        
        layer.cornerRadius = 6
    }
    
    private func showComingSoonFlow() {
        comingSoonImageView.isHidden = false
        overlayView.isHidden = false
    }

}
