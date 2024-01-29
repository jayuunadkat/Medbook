//
//  Constants.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 25/01/24.
//

import Foundation
import UIKit
import SwiftUI

// MARK: - Constant
class Constant {
    /// `header constants`
    static let content_type                         = "Content-Type"
    static let Authorization                        = "Authorization"
    static let DaysInWeek                           = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    /// `api constants`
    struct ServerAPI {
        /// `[base_url]`
//        static let BASE_URL                         =  "http://192.168.1.167/uleap/api/"
//        static let BASE_URL                         =  "http://18.171.88.171/api/"
        static let BASE_URL                         =  "https://uleap.co.uk/api/"
        
        /// `common` apis
        static let kPosts                           =  "posts"
    }
}


// MARK: - iPhone devicetype
struct DeviceType {
    static let IS_IPHONE_4_OR_LESS      = ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5              = ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6              = ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P             = ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_X              = ScreenSize.SCREEN_HEIGHT == 812.0
    static let IS_IPHONE_XMAX           = ScreenSize.SCREEN_HEIGHT == 896.0
    static let IS_PAD                   = UIDevice.current.userInterfaceIdiom == .pad
    static let IS_IPAD                  = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
    static let IsDeviceIPad             = IS_PAD || IS_IPAD || IS_IPAD_PRO ? true : false
}

///`ApiKeys`
struct ApiKeys {
    static let kAuthToken                   = "AuthToken"
    static let kAuthorization               = "Authorization"
}
    
// MARK: - Color Extensions
extension Color {

    public static var AppBlack: Color {
        return Color(uiColor: UIColor(named: "AppBlack") ?? .red)
    }
    public static var AppBorderColor: Color {
        return Color(uiColor: UIColor(named: "AppBorderColor") ?? .red)
    }
    public static var AppDarkPink: Color {
        return Color(uiColor: UIColor(named: "AppDarkPink") ?? .red)
    }
    public static var AppDarkPurple: Color {
        return Color(uiColor: UIColor(named: "AppDarkPurple") ?? .red)
    }
    public static var AppActivePurple: Color {
        return Color(uiColor: UIColor(named: "AppActivePurple") ?? .red)
    }
    public static var AppInActiveGray: Color {
        return Color(uiColor: UIColor(named: "AppInActiveGray") ?? .red)
    }
    public static var AppPink: Color {
        return Color(uiColor: UIColor(named: "AppPink") ?? .red)
    }
    public static var AppLightPink: Color {
        return Color(uiColor: UIColor(named: "AppLightPink") ?? .red)
    }
    public static var AppPlaceHolderColor: Color {
        return Color(uiColor: UIColor(named: "AppPlaceHolderColor") ?? .red)
    }
    public static var AppPurple: Color {
        return Color(uiColor: UIColor(named: "AppPurple") ?? .red)
    }
    public static var AppWhite: Color {
        return Color(uiColor: UIColor(named: "AppWhite") ?? .red)
    }
    
    public static let popUpBGColor = Color.black.opacity(0.7)

    public static var AppButtonBackgroundColor: Color {
        return Color(uiColor: UIColor(named: "AppButtonBackgroundColor") ?? .red)
    }
    public static var AppLightGrayColor: Color {
        return Color(uiColor: UIColor(named: "AppLightGrayColor") ?? .red)
    }
    public static var AppBackgroundGray: Color {
        return Color(uiColor: UIColor(named: "AppBackgroundGray") ?? .red)
    }
    public static var AppMembershipTextColor: Color {
        return Color(uiColor: UIColor(named: "AppMembershipTextColor") ?? .red)
    }
    public static var AppSubscribeOfferColor: Color {
        return Color(uiColor: UIColor(named: "AppSubscribeOfferColor") ?? .red)
    }
    public static var AppOfferTextColor: Color {
        return Color(uiColor: UIColor(named: "AppOfferTextColor") ?? .red)
    }
    public static var AppStrikeColor: Color {
        return Color(uiColor: UIColor(named: "AppStrikeColor") ?? .red)
    }
    public static var AppTextColor: Color {
        return Color(uiColor: UIColor(named: "AppTextColor") ?? .red)
    }
    public static var AppPoundTextColor: Color {
        return Color(uiColor: UIColor(named: "AppPoundTextColor") ?? .red)
    }
    public static var AppServicesTextColor: Color {
        return Color(uiColor: UIColor(named: "AppServicesTextColor") ?? .red)
    }
    public static var AppServicesBorderColor: Color {
        return Color(uiColor: UIColor(named: "AppServicesBorderColor") ?? .red)
    }
    public static var AppServiceNameColor: Color {
        return Color(uiColor: UIColor(named: "AppServiceNameColor") ?? .red)
    }
    public static var AppLightPurpleColor: Color {
        return Color(uiColor: UIColor(named: "AppLightPurpleColor") ?? .red)
    }
    public static var AppReviewBoxColor: Color {
        return Color(uiColor: UIColor(named: "AppReviewBoxColor") ?? .red)
    }
    public static var AppSegmentBackground: Color {
        return Color(uiColor: UIColor(named: "AppSegmentBackground") ?? .red)
    }
    public static var AppRatingPlaceHolder: Color {
        return Color(uiColor: UIColor(named: "AppRatingPlaceHolder") ?? .red)
    }
    public static var AppBackgroundColor: Color {
        return Color(uiColor: UIColor(named: "AppBackgroundColor") ?? .red)
    }
    public static var AppGrayColor: Color {
        return Color(uiColor: UIColor(named: "AppGrayColor") ?? .red)
    }
    public static var AppBackgroundDarkGray: Color {
        return Color(uiColor: UIColor(named: "AppBackgroundDarkGray") ?? .red)
    }
    public static var AppGrayTextColor: Color {
        return Color(uiColor: UIColor(named: "AppGrayTextColor") ?? .red)
    }
    public static var AppParrotColor: Color {
        return Color(uiColor: UIColor(named: "AppParrot") ?? .red)
    }
}


// MARK: - APIStatusCode
struct APIStatusCode {

    static let kSessionInvalid          = 401
    static let kSuccessResponse         = 200
    static let kFailResponse            = 400
}

///`Notification Name`
extension Notification.Name {
    static let showAlert                    = Notification.Name("showAlert")
    static let showCustomAlert              = Notification.Name("showCustomAlert")
    static let showRackRowPopup             = Notification.Name("showRackRowPopup")
    static let submitRackRow                = Notification.Name("submitRackRow")
    static let flowPopup                    = Notification.Name("flowpopup")
    static let showLoader                   = Notification.Name("showLoader")
  
}


// MARK: - iPhone Screensize
struct ScreenSize {
    static let SCREEN_WIDTH             = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT            = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH        = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH        = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

extension UIColor {
    
    static let flatDarkBackground = UIColor(red: 36, green: 36, blue: 36)
    static let flatDarkCardBackground = UIColor(red: 46, green: 46, blue: 46)
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }
}

extension Color {
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
    
    public static var flatDarkBackground: Color {
        return Color(decimalRed: 36, green: 36, blue: 36)
    }
    
    public static var flatDarkCardBackground: Color {
        return Color(decimalRed: 46, green: 46, blue: 46)
    }
}


