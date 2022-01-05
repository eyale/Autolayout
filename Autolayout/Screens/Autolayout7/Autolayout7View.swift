//
//  Autolayout7View.swift
//  Autolayout
//
//  Created by Anton Honcharov on 03.01.2022.
//

import UIKit

protocol AutolayoutDelegate: AnyObject {
    func handleDidLoadView(with: String)
}

class Autolayout7View: UIViewController {
    
    weak var delegate: AutolayoutDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = String(describing: Autolayout7View.self)
        
        delegate?.handleDidLoadView(with: "Autolayout7View is Loaded")
    }
}
