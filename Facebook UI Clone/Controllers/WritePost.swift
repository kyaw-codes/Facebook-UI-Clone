//
//  WritePost.swift
//  Facebook UI Clone
//
//  Created by Ko Kyaw on 08/01/2021.
//

import LBTATools
import SwiftUI

class WritePost: UIViewController {
    
    let profileImage = CircularImageView(width: 50, image: #imageLiteral(resourceName: "profile"))
    let postTextView = UITextView(text: "What's on your mind?", font: .systemFont(ofSize: 20), textColor: .gray)
    
    let liveButton = UIButton(titleAttrs: .init(title: "Live", font: .systemFont(ofSize: 18)), imageAttrs: .init(image: #imageLiteral(resourceName: "live"), size: .init(width: 18, height: 18)))
    
    let photoButton = UIButton(titleAttrs: .init(title: "Photo", font: .systemFont(ofSize: 18)), imageAttrs: .init(image: #imageLiteral(resourceName: "photos"), size: .init(width: 18, height: 18)))
    
    let roomButton = UIButton(titleAttrs: .init(title: "Room", font: .systemFont(ofSize: 18)), imageAttrs: .init(image: #imageLiteral(resourceName: "room"), size: .init(width: 18, height: 18)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        [liveButton, photoButton, roomButton].forEach { $0.backgroundColor = .white }
        
        let horizontalButtonStack = view.hstack(liveButton, photoButton, roomButton, spacing: 2, distribution: .fillEqually)
        horizontalButtonStack.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        
        view.stack(
            view.hstack(
                profileImage,
                view.stack(postTextView).padTop(4), spacing: 8),
            view.stack(
                UIView(backgroundColor: UIColor.init(white: 0.8, alpha: 1)).withHeight(0.5),
                horizontalButtonStack
            ),
            spacing: 12
        ).padLeft(12).padTop(12).padRight(12)
    }
}

struct WritePostPreview: PreviewProvider {
    
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return WritePost()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
