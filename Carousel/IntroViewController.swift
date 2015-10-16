//
//  IntroViewController.swift
//  Carousel
//
//  Created by Yang Tang on 10/13/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var introScrollView: UIScrollView!
    
    @IBOutlet weak var welcomeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //introScrollView.contentSize = welcomeImageView.image!.size
        introScrollView.contentSize = CGSize(width: 375, height: 1343)
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

}
