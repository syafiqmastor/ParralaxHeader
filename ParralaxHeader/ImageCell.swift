//
//  ImageCell.swift
//  ParralaxHeader
//
//  Created by Syafiq on 11/4/16.
//  Copyright © 2016 Syafiq. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    @IBOutlet weak var imageCenterYConstraint: NSLayoutConstraint!

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var bottomSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var topSpaceConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 0 {
            // scrolling up
            containerView.clipsToBounds = true
            bottomSpaceConstraint?.constant = -scrollView.contentOffset.y / 2
            topSpaceConstraint?.constant = scrollView.contentOffset.y / 2
        } else {
            // scrolling down
            topSpaceConstraint?.constant = scrollView.contentOffset.y
            containerView.clipsToBounds = false
        }
    }


}
