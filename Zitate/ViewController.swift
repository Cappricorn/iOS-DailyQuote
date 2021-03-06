//
//  ViewController.swift
//  Zitate
//
//  Created by Paul Huebner on 09.03.16.
//  Copyright © 2016 Paul Huebner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var setting = Settings()
    var quote = QuoteManager(package: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setting.getCurrentSettingsPackage()
        quote = QuoteManager(package: setting.choosedPackage)
        viewWillBeOnScreen()
    }
    
    override func viewWillAppear(animated: Bool) {
    }
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func tappedButtonLeft(sender: AnyObject) {
        quote.previousQuote()
        updateLabels()
    }
    
    @IBAction func tappedButtonRight(sender: AnyObject) {
        quote.nextQuote()
        updateLabels()
    }
    
    func updateLabels() {
        textLabel.text = "\"\(quote.parser.getQuote(quote.count).getQuote)\"\n\n- \(quote.parser.getQuote(quote.count).getAuthor) -"
        quote.saveCurrentQuote(quote.count)
    }
    
    func viewWillBeOnScreen() {
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            self.quote.getCurrentQuote()
            dispatch_async(dispatch_get_main_queue()) {
                self.updateLabels()
            }
        }
    }
}