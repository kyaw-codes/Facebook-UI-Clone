//
//  DoddleArea.swift
//  Facebook UI Clone
//
//  Created by Ko Kyaw on 04/01/2021.
//

import UIKit
import SwiftUI

// This is the place where I just sketch my random thoughts
class DoddleArea: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

struct DoddleAreaPreview: PreviewProvider {
    
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return DoddleArea()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
