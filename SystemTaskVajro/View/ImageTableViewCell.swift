//
//  ImageTableViewCell.swift
//  SystemTaskVajro
//
//  Created by mac on 02/09/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        viewContainer.layer.cornerRadius = 10
        imageItem.layer.cornerRadius = 10
        
        // Configure the view for the selected state
    }
    
    func setUpCell(articlesObject: ArticlesObject?) {
           title.text = articlesObject?.title
           descriptionLabel.text = articlesObject?.summaryText
        imageItem.frame =  CGRect(x: 0, y: 0, width: articlesObject?.imageData?.width ?? 0, height: articlesObject?.imageData?.height ?? 0) //CGRectMake(0,0,32,32);
        imageItem.sd_setImage(with: URL(string: articlesObject?.imageData?.src ?? ""), placeholderImage:nil)
        
       }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
