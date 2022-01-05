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
        let storyBoard = UIStoryboard(name: String(describing: Autolayout7View.self),
                                      bundle: nil)
        let autolayout1View = storyBoard.instantiateViewController(withIdentifier: String(describing: Autolayout7View.self)) as! Autolayout7View
        autolayout1View.delegate = self
        navigationController?.pushViewController(autolayout1View, animated: true)
    }
}

extension MainView: AutolayoutDelegate {
    func handleDidLoadView(with text: String) {
        print(text)
    }
}
