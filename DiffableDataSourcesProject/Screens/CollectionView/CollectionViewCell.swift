//
//  CollectionViewCell.swift
//  DiffableDataSourcesProject
//
//  Created by オムラユウキ on 2019/12/17.
//  Copyright © 2019 オムラユウキ. All rights reserved.
//

import UIKit

class MyCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var customBackgroundView: UIView!

    override func awakeFromNib() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
    }
}
