//
//  LocalizeJson.swift
//  Localize
//
//  Copyright © 2017 Kekiiwaa. All rights reserved.
//

import UIKit

class LocalizeJson: LocalizeCommonProtocol, LocalizeProtocol {

    /// Create default lang name
    override init() {
        super.init()
        self.fileName = "lang"
    }
    
    // MARK: Read JSON methods
    
    /// This metod contains a logic to read return JSON data
    /// If JSON not is defined, this try use a default
    /// As long as the default language is the same as the current one.
    private func readJSON(tableName:String? = nil) -> NSDictionary? {
        let tableName = tableName ?? self.fileName
        var lang = self.currentLanguage
        var json = self.readJSON(named: "\(tableName)-\(lang)")
        
        if json != nil {
            return json
        }
        
        lang = lang.components(separatedBy: "-")[0]
        json = self.readJSON(named: "\(tableName)-\(lang)")
        
        if json == nil && lang != self.defaultLanguage {
            json = self.readDefaultJSON()
        }
        
        return json
    }
    
    /// Read a JSON with default language value.
    ///
    /// - returns: json or nil value.
    private func readDefaultJSON(tableName:String? = nil) -> NSDictionary? {
        let tableName = tableName ?? self.fileName
        return self.readJSON(named: "\(tableName)-\(self.defaultLanguage)")
    }
    
    /// This method has path where file is
    /// If can't find a path return a nil value
    /// If can't serialize data return a nil value
    private func readJSON(named name:String) -> NSDictionary? {
        guard let path = self.bundle().path(forResource: name, ofType: "json") else {
            return nil
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            print("Localize can't read your file")
            return nil
        }
        do {
            return try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
        }
        catch {
            print("Localize can't parse your file")
            return nil
        }
    }
    
    /// Try search key in your dictionary using single level
    /// If it doesn't find the key it will use the multilevel
    /// If the key not exis in your JSON return nil value
    private func localizeFile(key:String, json:NSDictionary) -> String? {
        if let string = json[key] {
            return string as? String
        }
        
        if let string = self.localizeLevel(key: key, json: json) {
            return string
        }
        
        return nil
    }
    
    /// Try search key in your dictionary using multiples levels
    /// It is necessary that the result be a string
    /// Otherwise it returns nil value
    private func localizeLevel(key: String, json:AnyObject?) -> String? {
        let values = key.components(separatedBy: ".")
        var jsonCopy = json
        for key in values {
            if let result = jsonCopy?[key] {
                jsonCopy = result as AnyObject?
            } else {
                return nil
            }
        }
        return jsonCopy as? String
    }
    
    // MARK: Public methods
    
    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// That prevent replace untagged values
    ///
    /// - returns: localized key or same text
    public override func localize(key:String, tableName:String? = nil) -> String {
        guard let json = self.readJSON(tableName: tableName) else {
            return key
        }
        
        let string = self.localizeFile(key: key, json: json)
        if string != nil {
            return string!
        }
        
        guard let defaultJSON = self.readDefaultJSON(tableName: tableName) else {
            return key
        }
        
        let defaultString = self.localizeFile(key: key, json: defaultJSON)
        if defaultString != nil {
            return defaultString!
        }
        
        return key
    }
    
    
    // MARK: Config methods
    
    
    /// Show all aviable languages with criteria name
    ///
    /// - returns: list with storaged languages code
    public func availableLanguages() -> [String] {
        var languages : [String] = []

        for localeId in NSLocale.availableLocaleIdentifiers {
            let name = "\(self.fileName)-\(localeId)"
            let path = self.bundle().path(forResource: name, ofType: "json")
            if path != nil {
                languages.append(localeId)
            }
        }
        return languages
    }

}
