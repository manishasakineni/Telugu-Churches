//
//  LocalizeStrings.swift
//  Localize
//
//  Copyright © 2017 Kekiiwaa. All rights reserved.
//

import UIKit

class LocalizeStrings:LocalizeCommonProtocol, LocalizeProtocol {
    
    /// Create default lang name
    override init() {
        super.init()
        self.fileName = "Strings"
    }
    
    // MARK: Public methods
    
    
    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// That prevent replace untagged values
    ///
    /// - returns: localized key or same text
    public override func localize(key:String, tableName:String? = nil) -> String {
        let tableName = tableName ?? self.fileName
        if let path = self.bundle().path(forResource: self.currentLanguage, ofType: "lproj") {
            let bundle = Bundle(path: path)!
            let localized = bundle.localizedString(forKey: key, value: nil, table: tableName)
            if localized != key {
                return localized
            }
        }
        if let path = self.bundle().path(forResource: self.defaultLanguage, ofType: "lproj") {
            let bundle = Bundle(path: path)!
            return bundle.localizedString(forKey: key, value: nil, table: tableName)
        }
        return key
    }
    
    
    // MARK: Config methods
    
    
    /// Show all aviable languajes whit criteria name
    ///
    /// - returns: list with storaged languages code
    public func availableLanguages() -> [String] {
        var availableLanguages = self.bundle().localizations
        if let indexOfBase = availableLanguages.index(of: "Base") {
            availableLanguages.remove(at: indexOfBase)
        }
        return availableLanguages
    }
    
}
