//
//  FrontViewController.swift
//  SWArabic
//
//  Created by Patrick BODET on 30/08/2016.
//  Copyright © 2016 iDevelopper. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController {

    @IBOutlet weak var leftButton: UIBarButtonItem!
       
    @IBOutlet weak var rightButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(languageChanged(_:)), name: NSLocale.currentLocaleDidChangeNotification, object: nil)
        
        customSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func languageChanged(_ note: Notification)
    {
        customSetup()
    }
    
    func customSetup()
    {
        let preferredLanguage = Locale.preferredLanguages[0] as NSString
        print(preferredLanguage)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if preferredLanguage.substring(with: NSMakeRange(0, 2)) == "ar" {
            leftButton.target = self.revealViewController()
            leftButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            rightButton.target = self.revealViewController()
            rightButton.action = #selector(SWRevealViewController.revealToggle(_:))
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController1 = storyboard.instantiateViewController(withIdentifier :"RearTableViewController") as! RevealTableTableViewController
//            let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "RearTableViewController")
            revealViewController().rightViewController = viewController1
            let viewController2 = storyboard.instantiateViewController(withIdentifier :"RightViewController") as! RightViewController
            let viewControllerYouWantToPresent1 = viewController2
            revealViewController().rearViewController = viewControllerYouWantToPresent1
        }
        else {
            let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "RightViewController")
            revealViewController().rightViewController = viewControllerYouWantToPresent
            let viewControllerYouWantToPresent1 = self.storyboard?.instantiateViewController(withIdentifier: "RearTableViewController")
            revealViewController().rearViewController = viewControllerYouWantToPresent1
            
            leftButton.target = self.revealViewController()
            leftButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            rightButton.target = self.revealViewController()
            rightButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
        }
    }
}
