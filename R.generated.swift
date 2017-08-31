//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 color palettes.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `Default-568h@2x.png`.
    static let default568h2xPng = Rswift.FileResource(bundle: R.hostingBundle, name: "Default-568h@2x", pathExtension: "png")
    
    /// `bundle.url(forResource: "Default-568h@2x", withExtension: "png")`
    static func default568h2xPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.default568h2xPng
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 3 images.
  struct image {
    /// Image `Default-568h`.
    static let default568h = Rswift.ImageResource(bundle: R.hostingBundle, name: "Default-568h")
    /// Image `HeaderPlaceholder`.
    static let headerPlaceholder = Rswift.ImageResource(bundle: R.hostingBundle, name: "HeaderPlaceholder")
    /// Image `ProfilePricturePlaceholder`.
    static let profilePricturePlaceholder = Rswift.ImageResource(bundle: R.hostingBundle, name: "ProfilePricturePlaceholder")
    
    /// `UIImage(named: "Default-568h", bundle: ..., traitCollection: ...)`
    static func default568h(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.default568h, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "HeaderPlaceholder", bundle: ..., traitCollection: ...)`
    static func headerPlaceholder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.headerPlaceholder, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ProfilePricturePlaceholder", bundle: ..., traitCollection: ...)`
    static func profilePricturePlaceholder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.profilePricturePlaceholder, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `FollowerHeader`.
    static let followerHeader = _R.nib._FollowerHeader()
    
    /// `UINib(name: "FollowerHeader", in: bundle)`
    static func followerHeader(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.followerHeader)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 2 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `FollowerCollectionViewCell`.
    static let followerCollectionViewCell: Rswift.ReuseIdentifier<FollowerCollectionViewCell> = Rswift.ReuseIdentifier(identifier: "FollowerCollectionViewCell")
    /// Reuse identifier `TweetTableViewCell`.
    static let tweetTableViewCell: Rswift.ReuseIdentifier<TweetTableViewCell> = Rswift.ReuseIdentifier(identifier: "TweetTableViewCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 3 view controllers.
  struct segue {
    /// This struct is generated for `FollowersViewController`, and contains static references to 1 segues.
    struct followersViewController {
      /// Segue identifier `showProfileSegue`.
      static let showProfileSegue: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, FollowersViewController, ProfileViewController> = Rswift.StoryboardSegueIdentifier(identifier: "showProfileSegue")
      
      /// Optionally returns a typed version of segue `showProfileSegue`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func showProfileSegue(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, FollowersViewController, ProfileViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.followersViewController.showProfileSegue, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    /// This struct is generated for `LoginViewController`, and contains static references to 1 segues.
    struct loginViewController {
      /// Segue identifier `showUserFollowersSegue`.
      static let showUserFollowersSegue: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, LoginViewController, UIKit.UINavigationController> = Rswift.StoryboardSegueIdentifier(identifier: "showUserFollowersSegue")
      
      /// Optionally returns a typed version of segue `showUserFollowersSegue`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func showUserFollowersSegue(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, LoginViewController, UIKit.UINavigationController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.loginViewController.showUserFollowersSegue, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    /// This struct is generated for `ProfileViewController`, and contains static references to 1 segues.
    struct profileViewController {
      /// Segue identifier `showImageSegue`.
      static let showImageSegue: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, ProfileViewController, ImageViewerViewController> = Rswift.StoryboardSegueIdentifier(identifier: "showImageSegue")
      
      /// Optionally returns a typed version of segue `showImageSegue`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func showImageSegue(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, ProfileViewController, ImageViewerViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.profileViewController.showImageSegue, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 3 localization tables.
  struct string {
    /// This `R.string.launchScreen` struct is generated, and contains static references to 0 localization keys.
    struct launchScreen {
      fileprivate init() {}
    }
    
    /// This `R.string.localization` struct is generated, and contains static references to 5 localization keys.
    struct localization {
      /// Base translation: No Internet Connection
      /// 
      /// Locales: Base, ar
      static let noInternetConnection = Rswift.StringResource(key: "No Internet Connection", tableName: "Localization", bundle: R.hostingBundle, locales: ["Base", "ar"], comment: nil)
      /// Base translation: Okay
      /// 
      /// Locales: Base, ar
      static let okay = Rswift.StringResource(key: "Okay", tableName: "Localization", bundle: R.hostingBundle, locales: ["Base", "ar"], comment: nil)
      /// Base translation: Simple Twitter Client
      /// 
      /// Locales: Base, ar
      static let simpleTwitterClient = Rswift.StringResource(key: "Simple Twitter Client", tableName: "Localization", bundle: R.hostingBundle, locales: ["Base", "ar"], comment: nil)
      /// Base translation: Something went wrong
      /// 
      /// Locales: Base, ar
      static let somethingWentWrong = Rswift.StringResource(key: "Something went wrong", tableName: "Localization", bundle: R.hostingBundle, locales: ["Base", "ar"], comment: nil)
      /// Base translation: User is unauthorized
      /// 
      /// Locales: Base, ar
      static let userIsUnauthorized = Rswift.StringResource(key: "User is unauthorized", tableName: "Localization", bundle: R.hostingBundle, locales: ["Base", "ar"], comment: nil)
      
      /// Base translation: No Internet Connection
      /// 
      /// Locales: Base, ar
      static func noInternetConnection(_: Void = ()) -> String {
        return NSLocalizedString("No Internet Connection", tableName: "Localization", bundle: R.hostingBundle, value: "No Internet Connection", comment: "")
      }
      
      /// Base translation: Okay
      /// 
      /// Locales: Base, ar
      static func okay(_: Void = ()) -> String {
        return NSLocalizedString("Okay", tableName: "Localization", bundle: R.hostingBundle, value: "Okay", comment: "")
      }
      
      /// Base translation: Simple Twitter Client
      /// 
      /// Locales: Base, ar
      static func simpleTwitterClient(_: Void = ()) -> String {
        return NSLocalizedString("Simple Twitter Client", tableName: "Localization", bundle: R.hostingBundle, value: "Simple Twitter Client", comment: "")
      }
      
      /// Base translation: Something went wrong
      /// 
      /// Locales: Base, ar
      static func somethingWentWrong(_: Void = ()) -> String {
        return NSLocalizedString("Something went wrong", tableName: "Localization", bundle: R.hostingBundle, value: "Something went wrong", comment: "")
      }
      
      /// Base translation: User is unauthorized
      /// 
      /// Locales: Base, ar
      static func userIsUnauthorized(_: Void = ()) -> String {
        return NSLocalizedString("User is unauthorized", tableName: "Localization", bundle: R.hostingBundle, value: "User is unauthorized", comment: "")
      }
      
      fileprivate init() {}
    }
    
    /// This `R.string.main` struct is generated, and contains static references to 7 localization keys.
    struct main {
      /// ar translation:  
      /// 
      /// Locales: ar
      static let hWkFDG4JText = Rswift.StringResource(key: "hWk-fD-G4J.text", tableName: "Main", bundle: R.hostingBundle, locales: ["ar"], comment: nil)
      /// ar translation:  
      /// 
      /// Locales: ar
      static let jDPAyMbJText = Rswift.StringResource(key: "jDP-ay-mbJ.text", tableName: "Main", bundle: R.hostingBundle, locales: ["ar"], comment: nil)
      /// ar translation:  
      /// 
      /// Locales: ar
      static let z8WA9oTitle = Rswift.StringResource(key: "96Z-8W-A9o.title", tableName: "Main", bundle: R.hostingBundle, locales: ["ar"], comment: nil)
      /// ar translation: اسم المستخدم
      /// 
      /// Locales: ar
      static let bGWEMIuyText = Rswift.StringResource(key: "BGW-EM-Iuy.text", tableName: "Main", bundle: R.hostingBundle, locales: ["ar"], comment: nil)
      /// ar translation: المتابعون
      /// 
      /// Locales: ar
      static let b0dLl99gTitle = Rswift.StringResource(key: "B0d-Ll-99g.title", tableName: "Main", bundle: R.hostingBundle, locales: ["ar"], comment: nil)
      /// ar translation: تسجيل الدخول لتويتر
      /// 
      /// Locales: ar
      static let v3rGmC2gNormalTitle = Rswift.StringResource(key: "V3r-gm-c2g.normalTitle", tableName: "Main", bundle: R.hostingBundle, locales: ["ar"], comment: nil)
      /// ar translation: متابع
      /// 
      /// Locales: ar
      static let iig5hYHBTitle = Rswift.StringResource(key: "iig-5h-yHB.title", tableName: "Main", bundle: R.hostingBundle, locales: ["ar"], comment: nil)
      
      /// ar translation:  
      /// 
      /// Locales: ar
      static func hWkFDG4JText(_: Void = ()) -> String {
        return NSLocalizedString("hWk-fD-G4J.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// ar translation:  
      /// 
      /// Locales: ar
      static func jDPAyMbJText(_: Void = ()) -> String {
        return NSLocalizedString("jDP-ay-mbJ.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// ar translation:  
      /// 
      /// Locales: ar
      static func z8WA9oTitle(_: Void = ()) -> String {
        return NSLocalizedString("96Z-8W-A9o.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// ar translation: اسم المستخدم
      /// 
      /// Locales: ar
      static func bGWEMIuyText(_: Void = ()) -> String {
        return NSLocalizedString("BGW-EM-Iuy.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// ar translation: المتابعون
      /// 
      /// Locales: ar
      static func b0dLl99gTitle(_: Void = ()) -> String {
        return NSLocalizedString("B0d-Ll-99g.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// ar translation: تسجيل الدخول لتويتر
      /// 
      /// Locales: ar
      static func v3rGmC2gNormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("V3r-gm-c2g.normalTitle", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// ar translation: متابع
      /// 
      /// Locales: ar
      static func iig5hYHBTitle(_: Void = ()) -> String {
        return NSLocalizedString("iig-5h-yHB.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try nib.validate()
  }
  
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _FollowerHeader.validate()
    }
    
    struct _FollowerHeader: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "FollowerHeader"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "ProfilePricturePlaceholder", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ProfilePricturePlaceholder' is used in nib 'FollowerHeader', but couldn't be loaded.") }
        if UIKit.UIImage(named: "HeaderPlaceholder", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'HeaderPlaceholder' is used in nib 'FollowerHeader', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard {
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = LoginViewController
      
      let bundle = R.hostingBundle
      let name = "Main"
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
