//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Yang Tang on 10/15/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self

        scrollView.contentSize = CGSize(width: 1470, height: 647)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        if (page == 3) {
            pageControl.hidden = true
        } else {
            pageControl.hidden = false
        }
        // Set the current page, so the dots will update
        pageControl.currentPage = page
    }


}
