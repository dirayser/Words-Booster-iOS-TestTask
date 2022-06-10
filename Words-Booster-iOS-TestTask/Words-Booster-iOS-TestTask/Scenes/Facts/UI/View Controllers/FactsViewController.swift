//
//  FactsViewController.swift
//  Words-Booster-iOS-TestTask
//
//  Created by Dmitriy Dmitriyev on 10.06.2022.
//

import UIKit

class FactsViewController: UIViewController {
    
    @IBOutlet private weak var navBarView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var backButton: UIButton!
    
    @IBOutlet private weak var factView: UIView!
    @IBOutlet private weak var factImageView: UIImageView!
    @IBOutlet private weak var factLabel: UILabel!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var prevButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!
    
    var category: Category!
    var viewModel = FactsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        viewModel.setupFacts(for: category)
        setupUI()
    }
    
    private func setupUI() {
        navigationController?.isNavigationBarHidden = true
        setupNavBar()
        setupFactView()
        setupSwipe()
    }
    
    private func setupSwipe() {
        let swipeGestureRecognizerRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeGestureRecognizerRight.direction = .right
        let swipeGestureRecognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeGestureRecognizerLeft.direction = .left
        factView.addGestureRecognizer(swipeGestureRecognizerRight)
        factView.addGestureRecognizer(swipeGestureRecognizerLeft)
    }
    
    private func setupNavBar() {
        navBarView.layer.shadowOffset = CGSize(width: 0,
                                          height: 4)
        navBarView.layer.shadowRadius = 5
        navBarView.layer.shadowOpacity = 0.3
        
        titleLabel.text = category.title
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    private func setupFactView() {
        factView.layer.cornerRadius = 6
        factView.layer.shadowOffset = CGSize(width: 0,
                                          height: 10)
        factView.layer.shadowRadius = 5
        factView.layer.shadowOpacity = 0.3
        
        nextButton.addTarget(self, action: #selector(nextFact), for: .touchUpInside)
        prevButton.addTarget(self, action: #selector(prevFact), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareFact), for: .touchUpInside)
        
        guard let fact = viewModel.currentFact else { return }
        
        setFact(fact)
    }
    
    private func setFact(_ fact: Fact) {
        factImageView.image = nil
        
        factImageView.downloaded(from: fact.image)
        factLabel.text = fact.fact
    }
    
    @objc func back() {
        viewModel.back()
    }
    
    @objc func nextFact() {
        guard let nextFact = viewModel.nextFact() else { return }
        
        setFact(nextFact)
    }
    
    @objc func prevFact() {
        guard let prevFact = viewModel.previousFact() else { return }
        
        setFact(prevFact)
    }
    
    @objc func shareFact() {
        guard let currentFact = viewModel.currentFact else { return }
        
        var activityItems: [Any] = [currentFact.fact]
        if let img = factImageView.image { activityItems.insert(img, at: 0) }
        
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.print, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.postToVimeo]
        present(activityViewController, animated: true, completion: nil)
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            prevFact()
        } else if sender.direction == .right {
            nextFact()
        }
    }
    
}
