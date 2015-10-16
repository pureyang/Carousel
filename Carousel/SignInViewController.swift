//
//  SignInViewController.swift
//  Carousel
//
//  Created by Yang Tang on 10/13/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var siginButton: UIImageView!
    @IBOutlet weak var signInUIButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInActivityIndicatorView: UIActivityIndicatorView!
    
    let alertController = UIAlertController(title: "Title", message: "Please enter an Email and Password", preferredStyle: .Alert)

    let alertBadCredentialController = UIAlertController(title: "Title", message: "Your email and password do not match", preferredStyle: .Alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.signInActivityIndicatorView.hidden = true
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        alertBadCredentialController.addAction(OKAction)
        
        // setup the scroll view to actually scroll
        scrollView.contentSize = CGSize(width: 375, height: 685)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressSignIn(sender: AnyObject) {

        if (emailTextField.text == "" && passwordTextField.text == "" ||
            (emailTextField.text == "Email" &&
            passwordTextField.text == "Password")
        ) {
            signInActivityIndicatorView.hidden = false
            signInActivityIndicatorView.startAnimating()
            delay(2) {
                self.signInActivityIndicatorView.stopAnimating()
                self.signInActivityIndicatorView.hidden = true
                self.presentViewController(self.alertController, animated: true) {
                    // do noting on completion
                }
            }
        } else if (emailTextField.text != "pureyang@gmail.com" || passwordTextField.text != "1234") {
            self.signInActivityIndicatorView.hidden = false
            self.signInActivityIndicatorView.startAnimating()
            delay(2) {
                self.signInActivityIndicatorView.stopAnimating()
                self.signInActivityIndicatorView.hidden = true
                self.presentViewController(self.alertBadCredentialController, animated: true, completion: { () -> Void in
                    // do nothing on completion
                })
            }
        } else {
            self.signInActivityIndicatorView.hidden = false
            self.signInActivityIndicatorView.startAnimating()
            delay(2) {
                self.signInActivityIndicatorView.stopAnimating()
                self.signInActivityIndicatorView.hidden = true
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }
    @IBAction func didPressBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didEditBeginEmail(sender: AnyObject) {
        scrollSignInAboveKeyboard()
        scrollView.scrollEnabled = true
    }
    
    @IBAction func didEditBeginPassword(sender: AnyObject) {
        scrollSignInAboveKeyboard()
        scrollView.scrollEnabled = true
    }
    
    func scrollSignInAboveKeyboard() {
        // scroll to hide tip
        scrollView.contentOffset = CGPoint(x: 0, y: 85)
        // move button up
        UIView.animateWithDuration(0.3) { () ->
            Void in
            self.siginButton.center.y = 380
        }
        self.signInActivityIndicatorView.center.y = 365
        self.signInUIButton.center.y = 365
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
