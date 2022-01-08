//
//  MainView.swift
//  Autolayout
//
//  Created by Anton Honcharov on 05.12.2021.
//

import UIKit

class MainView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func handleTapGoTo(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: String(describing: ProgrammaticConstraintsView.self),
                                      bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: String(describing: ProgrammaticConstraintsView.self)) as! ProgrammaticConstraintsView
//        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
//
//extension MainView: AutolayoutDelegate {
//    func handleDidLoadView(with text: String) {
//        print(text)
//    }
//}
