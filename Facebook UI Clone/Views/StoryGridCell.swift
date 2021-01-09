//
//  StoryGridCell.swift
//  Facebook UI Clone
//
//  Created by Ko Kyaw on 08/01/2021.
//

import LBTATools
import UIKit

class StoryGridCell: LBTAListCell<Story> {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "profile"), contentMode: .scaleAspectFill)
    
    let bottomLabel = UILabel(text: "", font: .systemFont(ofSize: 15, weight: .heavy), textColor: .white, numberOfLines: 1)
    
    let topImageButton = UIImageView(image: nil, contentMode: .scaleAspectFit)
    let plusIconImageView = UIImageView()
    
    override var item: Story! {
        didSet {
            imageView.image = UIImage(named: item.imageName)
            bottomLabel.text = item.userName

            topImageButton.withSize(.init(width: 40, height: 40))
            topImageButton.layer.cornerRadius = 40 / 2
            topImageButton.clipsToBounds = true

            if item.imageName == "profile" {
                topImageButton.image = nil
                plusIconImageView.image = UIImage(systemName: "plus")
                topImageButton.stack(plusIconImageView).withMargins(.allSides(8))
                topImageButton.backgroundColor = .white
                topImageButton.layer.borderWidth = 0
            } else {
                plusIconImageView.image = nil
                topImageButton.image = #imageLiteral(resourceName: "profile")
                topImageButton.layer.borderWidth = 2.5
                topImageButton.layer.borderColor = UIColor.systemBlue.cgColor
            }
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true

        stack(imageView)

        addGradientLayer()
        
        stack(UIView(), bottomLabel).padLeft(10).padBottom(10)
        stack(topImageButton, UIView(), alignment: .leading).padLeft(10).padTop(10)
    }
    
    let gradientLayer = CAGradientLayer()

    fileprivate func addGradientLayer() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.8, 1]
        
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
}
