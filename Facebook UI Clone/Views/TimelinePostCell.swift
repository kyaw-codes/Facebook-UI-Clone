//
//  PostCell.swift
//  Facebook UI Clone
//
//  Created by Ko Kyaw on 08/01/2021.
//

import LBTATools
import UIKit

class TimelinePostCell: LBTAListCell<String> {
    
    fileprivate var profileImageView = CircularImageView(width: 48, image: #imageLiteral(resourceName: "profile"))
    
    fileprivate var postTextLabel = UILabel(text: "丁寧に丁寧に、あらゆることを感じたくて。信じたくて、諦めたくなくて。来年も真っ直ぐに、生きていたいです。今年もたくさんたくさんありがとう、本当にありがとう。心身ともに皆様の健康を、心からお祈りしています。良い時間を過ごしてね", font: .systemFont(ofSize: 16), numberOfLines: 3)
    
    fileprivate var nameLabel = UILabel(text: "Kasumi Arimura", font: .boldSystemFont(ofSize: 18))
    
    fileprivate var dateLabel = UILabel(text: "Thursday at 2:04 PM", font: .systemFont(ofSize: 15),  textColor: .gray)
    
    fileprivate var imageGrid = PhotoGridList()
    
    fileprivate var likeButton = UIButton(titleAttrs: .init(title: "Like", color: .darkGray, font: .systemFont(ofSize: 16)), imageAttrs: .init(image: #imageLiteral(resourceName: "thumb-up"), size: .init(width: 22, height: 22)))
    
    fileprivate var commentButton = UIButton(titleAttrs: .init(title: "Comment", color: .darkGray, font: .systemFont(ofSize: 16)), imageAttrs: .init(image: #imageLiteral(resourceName: "comment"), size: .init(width: 22, height: 22)))
    
    fileprivate var shareButton = UIButton(titleAttrs: .init(title: "Share", color: .darkGray, font: .systemFont(ofSize: 16)), imageAttrs: .init(image: #imageLiteral(resourceName: "share"), size: .init(width: 22, height: 22)))
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        let buttonStack = hstack(likeButton, commentButton, shareButton, spacing: 1, distribution: .fillEqually)
        buttonStack.withHeight(38)
        
        stack(stack(
                hstack(profileImageView, stack(nameLabel, dateLabel).padLeft(12)),
                postTextLabel, spacing: 16).withMargins(.allSides(12)),
                imageGrid.view,
                buttonStack, spacing: 2)
    }
}
