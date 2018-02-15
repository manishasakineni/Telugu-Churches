//
//  LocalizableSwift.swift
//  Localize
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import UIKit

/// Name for language change notification
public let LocalizeChangeNotification = "LocalizeChangeNotification"

/// Internal current language key
public let LocalizeStorageKey = "LocalizeDefaultLanguage"


/// Different types to localize your app, using json files or strings default by Apple.
public enum LocalizeType {
    /// Custom localize protocol.
    case json
    /// Default Apple protocol.
    case strings
}

/// Is a pricipal class, contents all logic to localize your keys
/// read json and determinate all configurations.
public class Localize: NSObject {
    
    // MARK: Properties
    
    /// Shated instance
    public static let shared: Localize = Localize()
    
    /// Provider to localize your app.
    private var provider: LocalizeProtocol = LocalizeStrings()
    
    /// This override prevent user access to different instances for this class.
    /// Always use shared instance.
    private override init() {
        super.init()
    }
    
    // MARK: Public methods
    
    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// That prevent replace untagged values
    ///
    /// - returns: localized key or same text
    public func localize(key:String, tableName:String? = nil) -> String {
        return self.provider.localize(key: key, tableName: tableName)
    }
    
    /// Localize a string using your JSON File
    /// That replace all % character in your string with replace value.
    ///
    /// - parameter value: The replacement value
    ///
    /// - returns: localized key or same text
    public func localize(key:String, replace:String, tableName:String? = nil) -> String {
        return self.provider.localize(key: key, replace: replace, tableName:tableName)
    }
    
    /// Localize a string using your JSON File
    /// That replace each % character in your string with each replace value.
    ///
    /// - parameter value: The replacement values
    ///
    /// - returns: localized key or same text
    public func localize(key:String, values:[Any], tableName:String? = nil) -> String {
        return self.provider.localize(key: key, values: values, tableName:tableName)
    }
    
    /// Localize string with dictionary values
    /// Get properties in your key with rule :property
    /// If property not exist in this string, not is used.
    ///
    /// - parameter value: The replacement dictionary
    ///
    /// - returns: localized key or same text
    public func localize(key:String, dictionary:[String:String], tableName:String? = nil) -> String {
        return self.provider.localize(key: key, dictionary: dictionary, tableName:tableName)
    }

    
    // MARK: Config methods
    
    
    /// Return storaged language or default language in device
    ///
    /// - returns: current used language
    public func language() -> String {
        return self.provider.language()
    }
    
    /// Update default language, this stores a language key which can be retrieved the next time
    public func update(language: String) -> Void {
        self.provider.update(language: language)
    }
    
    /// Update base file name, searched in path.
    public func update(fileName:String) {
        self.provider.update(fileName: fileName)
    }
    
    /// Update the bundle used to load files from.
    public func update(bundle: Bundle) {
        self.provider.update(bundle: bundle)
    }

    /// Update default language
    public func update(defaultLanguage: String) {
        self.provider.update(defaultLanguage: defaultLanguage)
    }
    
    /// This remove the language key storaged.
    public func resetLanguage() -> Void {
        self.provider.resetLanguage()
    }
    
    /// Show all aviable languajes whit criteria name
    ///
    /// - returns: list with storaged languages code
    public func availableLanguages() -> [String] {
        return self.provider.availableLanguages()
    }
    
    /// Display name for current user language.
    ///
    /// - return: String form language code in current user language
    public func displayNameForLanguage(_ language: String) -> String {
        return self.provider.displayNameForLanguage(language)
    }
    
    /// Enable testing mode
    /// Please not use in your code, is only for test schema.
    public func testingMode() {
        self.provider.testingMode()
    }
    
    // MARK: Config providers
    
    /// Update provider to localize your app.
    public func update(provider: LocalizeType) {
        if provider == .strings {
            self.provider = LocalizeStrings()
        }
        if provider == .json {
            self.provider = LocalizeJson()
        }
    }
    
}
