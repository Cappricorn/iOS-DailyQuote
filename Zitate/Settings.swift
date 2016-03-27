//
//  Settings.swift
//  Zitate
//
//  Created by Paul Huebner on 19.03.16.
//  Copyright © 2016 Paul Huebner. All rights reserved.
//

import Foundation

class Settings {
    private var dailyQuote = true
    private var package = 0
    
    var wantsDailyQuote: Bool {
        get {
            return dailyQuote
        } set {
            self.dailyQuote = wantsDailyQuote
        }
    }
    
    var choosedPackage: Int {
        get {
            return package
        } set {
            self.package = choosedPackage
        }
    }
    
    init(){}
    
    func getCurrentSettingsPackage() {
        if let currentPackage = NSUserDefaults.standardUserDefaults().valueForKey("currentPackage") as? Int
        {
            package = currentPackage
        } else {
            package = 0
        }
    }
    
    func saveCurrentSettingsPackage(value: Int) {
        NSUserDefaults.standardUserDefaults().setValue(value, forKey: "currentPackage")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func getCurrentSettingsDailyQuote() {
        if let dailyQuoteStatus = NSUserDefaults.standardUserDefaults().valueForKey("dailyQuoteStatus") as? Bool
        {
            dailyQuote = dailyQuoteStatus
        } else {
            dailyQuote = true
        }
    }
    
    func saveCurrentSettingsDailyQuote(value: Bool) {
        NSUserDefaults.standardUserDefaults().setValue(value, forKey: "dailyQuoteStatus")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
}