//
//  StoryGrid.swift
//  Facebook UI Clone
//
//  Created by Ko Kyaw on 08/01/2021.
//

import LBTATools
import SwiftUI

struct Story {
    var imageName, userName: String
}

class StoryGridList: LBTAListController<StoryGridCell, Story>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = [
            .init(imageName: "profile", userName: "Add to Story"),
            .init(imageName: "one", userName: "Kasumi Arimura"),
            .init(imageName: "two", userName: "Kasumi"),
            .init(imageName: "three", userName: "Arimura"),
            .init(imageName: "four", userName: "Monkey"),
            .init(imageName: "five", userName: "KeKe")
        ]
        
        collectionView.showsHorizontalScrollIndicator = false
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width / 3.5, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 12, bottom: 20, right: 12)
    }
    
}

struct StoryGridPreview: PreviewProvider {
    
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return StoryGridList(scrollDirection: .horizontal)
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
