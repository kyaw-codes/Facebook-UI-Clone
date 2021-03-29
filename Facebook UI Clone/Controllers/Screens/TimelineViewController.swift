//
//  MainController.swift
//  Facebook UI Clone
//
//  Created by Ko Kyaw on 04/01/2021.
//

import LBTATools
import SwiftUI

class TimelineViewController: LBTAListHeaderController<TimelinePostCell, String, TimelineHeader>, UICollectionViewDelegateFlowLayout {

    let fbLogoImageView = UIImageView(image: #imageLiteral(resourceName: "logo"), contentMode: .scaleAspectFill)
    let topButtonSize: CGSize = .init(width: 35, height: 35)
    let logoWidth: CGFloat = 110
    
    let searchButtonView = UIView(backgroundColor: .init(red: 237/255, green: 236/255, blue: 239/255, alpha: 1))
    let messengerButtonView = UIView(backgroundColor: .init(red: 237/255, green: 236/255, blue: 239/255, alpha: 1))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchButtonView.withSize(topButtonSize)
        messengerButtonView.withSize(topButtonSize)

        items = ["one", "two", "three"]

        collectionView.backgroundColor = .init(white: 0.85, alpha: 1)
        
        setupNavBar()
        setupTopButtons()
    }
    
    fileprivate func setupNavBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        // This two line will remove the border of the navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    fileprivate func setupTopButtons() {
        // 120(Fb logo width), 12(left and right insets), 78(search + messenger button + spacing value of 8)
        let spacerWidth = view.frame.width - 120 - 16 - 78
        let titleView = UIView()
        titleView.frame = .init(x: 0, y: 0, width: view.frame.width, height: 100)
        
        // lay search and messenger button out inside titleView
        [searchButtonView, messengerButtonView].forEach { $0.layer.cornerRadius = topButtonSize.width / 2 }
        
        searchButtonView.stack(UIImageView(image: #imageLiteral(resourceName: "lens"), contentMode: .scaleAspectFit)).withMargins(.allSides(8))
        messengerButtonView.stack(UIImageView(image: #imageLiteral(resourceName: "messenger"), contentMode: .scaleAspectFit)).withMargins(.allSides(6))
            
        titleView.hstack(
            fbLogoImageView.withWidth(logoWidth),
            UIView().withWidth(spacerWidth), // Spacer view
            titleView.hstack(
                searchButtonView,
                messengerButtonView, spacing: 8
            )
        )
        
        navigationItem.titleView = titleView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.width + 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 8, left: 0, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as? TimelinePostCell else { fatalError("Post cell not found!") }
        cell.onLikeButtonLongPressed = { [weak self] gesture in
            debugPrint(gesture.view!.frame)
        }
        return cell
    }
}

struct Preview: PreviewProvider {
    
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return UINavigationController(rootViewController: TimelineViewController())
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
    
}
