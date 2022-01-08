//
//  ProgrammaticConstraintsView.swift
//  Autolayout
//
//  Created by Anton Honcharov on 08.01.2022.
//

import UIKit

class ProgrammaticConstraintsView: UIViewController {
    
    
    @IBOutlet weak var simpleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        makeLayoutAnchors()
        makeNSLayoutConstraintClassForSimpleView()
    }
}

// MARK: - Private Methods Extension
private extension ProgrammaticConstraintsView {
    
    /// NSLayoutConstraint Class
    func makeNSLayoutConstraintClassForSimpleView() {
        simpleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: simpleView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leadingMargin,
                           multiplier: 1.0,
                           constant: .zero).isActive = true
        
        NSLayoutConstraint(item: simpleView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailingMargin,
                           multiplier: 1.0,
                           constant: .zero).isActive = true
        
        NSLayoutConstraint(item: simpleView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: simpleView,
                           attribute: .width,
                           multiplier: 2.0,
                           constant: .zero).isActive = true
    }
    
    /// Layout Anchor API
    func makeLayoutAnchors() {
        let margins = view.layoutMarginsGuide

        simpleView.translatesAutoresizingMaskIntoConstraints = false
        simpleView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        simpleView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        simpleView.heightAnchor.constraint(equalTo: simpleView.widthAnchor, multiplier: 2.0).isActive = true
    }
}
