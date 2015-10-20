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
    @IBOutlet weak var image2View: UIImageView!
    @IBOutlet weak var image3View: UIImageView!
    @IBOutlet weak var image4View: UIImageView!
    @IBOutlet weak var image5View: UIImageView!
    @IBOutlet weak var image6View: UIImageView!
    
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: 375, height: 2000)
        
        NSLog("image1 start %@", NSStringFromCGPoint(image1View.center))
        NSLog("image2 start %@", NSStringFromCGPoint(image2View.center))
        NSLog("image3 start %@", NSStringFromCGPoint(image3View.center))
        NSLog("image4 start %@", NSStringFromCGPoint(image4View.center))
        NSLog("image5 start %@", NSStringFromCGPoint(image5View.center))
        NSLog("image6 start %@", NSStringFromCGPoint(image6View.center))
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
        

        NSLog("%@", NSStringFromCGPoint(scrollView.contentOffset))
        // scrollview
        // y = 20 is top
        // y = 660 is bottom
        // scrolling down
        
        // image1 start {90.5, 572}
        // image1 end {149.5, 955}

        // image2 start {220, 574}
        // image2 end {268, 949}

        // image3 start {292.5, 593}
        // image3 end {260, 1079}

        // image4 start {188, 610.5}
        // image4 end {268, 990.5}

        // image5 start {252, 611.5}
        // image5 end {174, 1098.5}

        // image6 start {337, 612}
        // image6 end {95, 1098}

        if (scrollView.contentOffset.y <= 660) {
            let percentScrolled = scrollView.contentOffset.y / 660.0
            // image1
            self.image1View.center.y = percentScrolled * 383.0 + 572.0
            self.image1View.center.x = percentScrolled * 59 + 90.5
            // TODO rotation
            // TODO zoom
            self.image2View.center.y = percentScrolled * 375.0 + 542.0
            self.image2View.center.x = percentScrolled * -48 + 330.5
            
            self.image3View.center.y = percentScrolled * 486.0 + 593.0
            self.image3View.center.x = percentScrolled * -32.0 + 292.5
            
            self.image4View.center.y = percentScrolled * 383.0 + 610.0
            self.image4View.center.x = percentScrolled * -80 + 350.5

            self.image5View.center.y = percentScrolled * 486.0 + 593.0
            self.image5View.center.x = percentScrolled * -78 + 252

            self.image6View.center.y = percentScrolled * 486.0 + 593.0
            self.image6View.center.x = percentScrolled * -242 + 337
        }

        
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
