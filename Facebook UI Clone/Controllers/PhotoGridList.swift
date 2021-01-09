//
//  PhotoGrid.swift
//  Facebook UI Clone
//
//  Created by Ko Kyaw on 07/01/2021.
//

import LBTATools
import SwiftUI

class PhotoGridList: LBTAListController<PhotoGridCell, String>, UICollectionViewDelegateFlowLayout {
    
    fileprivate let padding: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = ["one", "two", "three", "four", "five"]
        collectionView.isScrollEnabled = false
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 0 || indexPath.row == 1 {
            let width = (view.frame.width / 2) - 2
            return .init(width: width, height: width)
        }
        
        let width = (view.frame.width / 3) - 2
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
}

struct PhotoGridPreview: PreviewProvider {
    
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return PhotoGridList()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
