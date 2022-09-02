//
//  ViewController.swift
//  AmazonHome
//
//  Created by Mitya Kim on 9/1/22.
//

import UIKit

class HomeMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}

class OriginalsMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
    }
}

class TVMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
}

class MoviesMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
    }
}

class KidsMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}

class TitleBarViewController: UIViewController {
    
    var homeBarButtonItem: UIBarButtonItem!
    var originalsBarButtonItem: UIBarButtonItem!
    var tvBarButtonItem: UIBarButtonItem!
    var moviesBarButtonItem: UIBarButtonItem!
    var kidsBarButtonItem: UIBarButtonItem!
    
    let container = Container()
    
    let viewControllers: [UIViewController] = [HomeMenuViewController(), OriginalsMenuViewController(), TVMenuViewController(), MoviesMenuViewController(), KidsMenuViewController()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupViews()
    }
    
    func setupNavBar() {
        navigationItem.leftBarButtonItems = [homeBarButtonItem, originalsBarButtonItem, tvBarButtonItem, moviesBarButtonItem, kidsBarButtonItem]
    }
    
    func setupViews() {
        guard let containerView = container.view else { return }
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        homeBarButtonItem = makeBarButtonItem(text: "Home", selector: #selector(homeTapped))
        originalsBarButtonItem = makeBarButtonItem(text: "Originals", selector: #selector(originalsTapped))
        tvBarButtonItem = makeBarButtonItem(text: "TV", selector: #selector(tvTapped))
        moviesBarButtonItem = makeBarButtonItem(text: "Movies", selector: #selector(moviesTapped))
        kidsBarButtonItem = makeBarButtonItem(text: "Kids", selector: #selector(kidsTapped))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeBarButtonItem(text: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: selector, for: .primaryActionTriggered)
        
        let attr = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .footnote).withTraits(traits: [.traitBold]),
                    NSAttributedString.Key.foregroundColor: UIColor.label
        ]
        
        let attrText = NSMutableAttributedString(string: text, attributes: attr)
        
        button.setAttributedTitle(attrText, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        
        let barButtonItem = UIBarButtonItem(customView: button)
        
        return barButtonItem
    }
}

// MARK: - Actions
extension TitleBarViewController {
    @objc func homeTapped() {
        if container.children.first == viewControllers[0] { return }
        container.add(viewControllers[0])
        viewControllers[1].remove()
        viewControllers[2].remove()
        viewControllers[3].remove()
        viewControllers[4].remove()
        
        UIView.animate(withDuration: 0.5) {
            self.homeBarButtonItem.customView?.alpha = 1.0
            self.originalsBarButtonItem.customView?.alpha = 0.5
            self.tvBarButtonItem.customView?.alpha = 0.5
            self.moviesBarButtonItem.customView?.alpha = 0.5
            self.kidsBarButtonItem.customView?.alpha = 0.5
        }
    }
    
    @objc func originalsTapped() {
        if container.children.first == viewControllers[1] { return }
        container.add(viewControllers[1])
        viewControllers[0].remove()
        viewControllers[2].remove()
        viewControllers[3].remove()
        viewControllers[4].remove()
        
        UIView.animate(withDuration: 0.5) {
            self.homeBarButtonItem.customView?.alpha = 0.5
            self.originalsBarButtonItem.customView?.alpha = 1.0
            self.tvBarButtonItem.customView?.alpha = 0.5
            self.moviesBarButtonItem.customView?.alpha = 0.5
            self.kidsBarButtonItem.customView?.alpha = 0.5
        }
    }
    
    @objc func tvTapped() {
        if container.children.first == viewControllers[2] { return }
        container.add(viewControllers[2])
        viewControllers[1].remove()
        viewControllers[0].remove()
        viewControllers[3].remove()
        viewControllers[4].remove()
        
        UIView.animate(withDuration: 0.5) {
            self.homeBarButtonItem.customView?.alpha = 0.5
            self.originalsBarButtonItem.customView?.alpha = 0.5
            self.tvBarButtonItem.customView?.alpha = 1.0
            self.moviesBarButtonItem.customView?.alpha = 0.5
            self.kidsBarButtonItem.customView?.alpha = 0.5
        }
    }
    
    @objc func moviesTapped() {
        if container.children.first == viewControllers[3] { return }
        container.add(viewControllers[3])
        viewControllers[1].remove()
        viewControllers[0].remove()
        viewControllers[2].remove()
        viewControllers[4].remove()
        
        UIView.animate(withDuration: 0.5) {
            self.homeBarButtonItem.customView?.alpha = 0.5
            self.originalsBarButtonItem.customView?.alpha = 0.5
            self.tvBarButtonItem.customView?.alpha = 0.5
            self.moviesBarButtonItem.customView?.alpha = 1.0
            self.kidsBarButtonItem.customView?.alpha = 0.5
        }
    }
    
    @objc func kidsTapped() {
        if container.children.first == viewControllers[4] { return }
        container.add(viewControllers[4])
        viewControllers[1].remove()
        viewControllers[0].remove()
        viewControllers[3].remove()
        viewControllers[2].remove()
        
        UIView.animate(withDuration: 0.5) {
            self.homeBarButtonItem.customView?.alpha = 0.5
            self.originalsBarButtonItem.customView?.alpha = 0.5
            self.tvBarButtonItem.customView?.alpha = 0.5
            self.moviesBarButtonItem.customView?.alpha = 0.5
            self.kidsBarButtonItem.customView?.alpha = 1.0
        }
    }
}

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

extension UIFont {
    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
}
