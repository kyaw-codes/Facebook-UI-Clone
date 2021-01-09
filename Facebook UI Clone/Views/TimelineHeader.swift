//
//  TimelineHeader.swift
//  Facebook UI Clone
//
//  Created by Ko Kyaw on 08/01/2021.
//

import UIKit

class TimelineHeader: UICollectionReusableView {
    
    let writePost = WritePost()
    let storyGrid = StoryGridList(scrollDirection: .horizontal)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(white: 0.85, alpha: 1)
        
        stack(writePost.view, storyGrid.view, spacing: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
