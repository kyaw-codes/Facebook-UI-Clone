//
//  PhotoGridCell.swift
//  Facebook UI Clone
//
//  Created by Ko Kyaw on 08/01/2021.
//

import LBTATools
import UIKit

class PhotoGridCell: LBTAListCell<String> {
    
    override var item: String! {
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    
    let imageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
    
    override func setupViews() {
        super.setupViews()
        
        stack(imageView)
    }
}
