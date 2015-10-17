//
//  ScrollingIntroViewController.swift
//  Carousel
//
//  Created by Yang Tang on 10/16/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit

class ScrollingIntroViewController: UIViewController, UIScrollViewDelegate {

    // orig x 14 y 496 finish x 68 y 893
    @IBOutlet weak var image1View: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var lastContentYOffset = CGFloat(0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: 375, height: 2000)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated);
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillAppear(animated);
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        

        // scrolling down
        /*
        if (origScrollPoint.y <= scrollView.center.y) {
            self.image1View.center.y = self.image1View.center.y + 2
        } else if (origScrollPoint.y > scrollView.center.y) {
            self.image1View.center.y = self.image1View.center.y - 2
        }
        
        */
        
        if (self.lastContentYOffset > scrollView.contentOffset.y) {
            self.image1View.center.y = self.image1View.center.y - 2
        } else if (self.lastContentYOffset < scrollView.contentOffset.y) {
            self.image1View.center.y = self.image1View.center.y + 2
        }
        self.lastContentYOffset = scrollView.contentOffset.y
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
