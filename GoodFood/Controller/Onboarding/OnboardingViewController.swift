//
//  OnboardingViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 24.10.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    // MARK: -outlets
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    
    // MARK: -variables
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage

            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Starded", for: .normal)
            }else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [OnboardingSlide(title: "Get fastest delivery ", description: "Lorem Ipsum is simply dummy text of the printing.", image: #imageLiteral(resourceName: "onboardingMotor")),
         OnboardingSlide(title: "Pick the best food", description: "Lorem Ipsum is simply dummy text of the printing. ", image: #imageLiteral(resourceName: "pizzeria")),
         OnboardingSlide(title: "Rates your food", description: "Lorem Ipsum is simply dummy text of the printing. ", image: #imageLiteral(resourceName: "food-ordering"))]
        }
    // MARK: -button
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            performSegue(withIdentifier: "toSingin", sender: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}
// MARK: -extension
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: -collection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    // MARK: -scroll
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
