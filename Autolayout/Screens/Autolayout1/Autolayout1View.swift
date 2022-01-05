//
//  Autolayout1View.swift
//  Autolayout
//
//  Created by Anton Honcharov on 24.12.2021.
//

import UIKit

final class Autolayout1View: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = String(describing: Autolayout1View.self)
    }
}


#if DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct Autolayout1ViewPreview: PreviewProvider {
    static var previews: some View {
        Autolayout1View().toPreview()
    }
}
#endif

/**
 This shows how to preview `Storyboards`
 */
//#if DEBUG
//import SwiftUI
//
//@available(iOS 13, *)
//struct MainViewPreview: PreviewProvider {
//    static var previews: some View {
//        // Assuming your storyboard file name is "Main"
//        UIStoryboard(name: "MainView",
//                     bundle: nil)
//            .instantiateViewController(identifier: "MainViewSBID")
//            .toPreview()
//    }
//}
//#endif
//

