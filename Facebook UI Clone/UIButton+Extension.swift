//
//  UIButton+Extensions.swift
//  Facebook UI Clone
//
//  Created by Ko Kyaw on 06/01/2021.
//

import UIKit

extension UIButton {
    
    convenience public init(titleAttrs: TitleAttributesModel, imageAttrs: ImageAttributesModel, imageAlignment: ImageAlignment = .leftAligned, spacing: CGFloat = 8) {
        self.init()
        
        let titleLabel = UILabel(text: titleAttrs.title, font: titleAttrs.font, textColor: titleAttrs.color, textAlignment: .center, numberOfLines: 1)
        
        let imageView = UIImageView(image: imageAttrs.image, contentMode: imageAttrs.contentMode)
        
        [titleLabel, imageView].forEach { view in
            // Add view to superview
            addSubview(view)
            // Enable autolayout constraints
            view.translatesAutoresizingMaskIntoConstraints = false
            // Center the view in Y axix
            view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }
        
        // Set width and height for image view
        imageView.widthAnchor.constraint(equalToConstant: imageAttrs.size.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageAttrs.size.height).isActive = true
        
        if imageAlignment == .leftAligned {
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 12).isActive = true
            imageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -spacing).isActive = true
        } else {
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -12).isActive = true
            imageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: spacing).isActive = true
        }
    }
    
    public struct TitleAttributesModel {
        var title: String
        var color: UIColor = .gray
        var font: UIFont = .systemFont(ofSize: 20)
    }
    
    public struct ImageAttributesModel {
        var image: UIImage
        var size: CGSize = .init(width: 20, height: 20)
        var contentMode: UIView.ContentMode = .scaleAspectFit
    }
    
    public enum ImageAlignment {
        case leftAligned, rightAligned
    }
}
