//
//  Autolayout4View.swift
//  Autolayout
//
//  Created by Anton Honcharov on 29.12.2021.
//

import UIKit

final class Autolayout4View: UIViewController {
    
    private let animationDuration: Double = 0.2
    
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var stackVew:   UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = String(describing: Autolayout4View.self)
        setupInsets()
    }
    
}
// MARK: - Actions
extension Autolayout4View {
    @IBAction func addEntry(sender: UIButton) {
        
        /// Getting `StackView` itself
        let stack = stackVew
        
        /// Getting `SubViews` list `count` inside the `StackView`
        guard let stackSubviewsCount = stack?.arrangedSubviews.count else { return }
        
        /// `count` or `lenght` of the array always bigger by 1 then index of last element of array
        /// That's because of arrays counting from `0`
        let index = stackSubviewsCount - 1
        let addView = stack?.arrangedSubviews[index]
        
        let scroll = scrollView
        guard let scrollX = scroll?.contentOffset.x,
              let scrollY = scroll?.contentOffset.y,
              let addViewHeight = addView?.frame.size.height else { return }
        
        let offset = CGPoint(x:  scrollX, y: scrollY + addViewHeight)
        
        let newView = createEntry()
        newView.isHidden = true
        
        /// inserting `newView` at the end of the `StackView` by `index`
        stack?.insertArrangedSubview(newView, at: index)
        
        UIView.animate(withDuration: animationDuration) {
            newView.isHidden = false
            scroll?.contentOffset = offset
        }
    }
}

// MARK: - Private Methods Extension
private extension Autolayout4View {
    
    func makeDate() -> String {
        DateFormatter.localizedString(from: Date(),
                                      dateStyle: .short,
                                      timeStyle: .none)
    }
    
    func makeNumber() -> String { "\(arc4random())" }
    
    func makeStackView() -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        stack.axis = .horizontal
        stack.alignment = .firstBaseline
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }
    
    @objc func deleteStackView(sender: UIButton) {
        
        /// Getting `Superview` of `Button` that invoked this methhod
        guard let view = sender.superview else { return }
        UIView.animate(withDuration: animationDuration,
                       animations: { view.isHidden = true }) { _ in
            view.removeFromSuperview()
        }
    }
    
    func createEntry() -> UIView {
        
        let dateLabel = UILabel()
        dateLabel.text = makeDate()
        dateLabel.font = .preferredFont(forTextStyle: .body)
        
        let numberLabel = UILabel()
        numberLabel.text = makeNumber()
        numberLabel.font = .preferredFont(forTextStyle: .headline)
        
        let deleteButton = UIButton(type: .roundedRect)
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.tintColor = .red
        deleteButton.addTarget(self,
                               action: #selector(deleteStackView(sender:)),
                               for: .touchUpInside)
        
        let stack = makeStackView()
        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(numberLabel)
        stack.addArrangedSubview(deleteButton)
        
        return stack
    }
    
    
    func setupInsets() {
        let insets = UIEdgeInsets(top: 20,
                                  left: .zero,
                                  bottom: .zero,
                                  right: .zero)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
    }
}
