//
//  ConstantExtension.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 25/01/24.
//

import Foundation
import UIKit

extension Constant {
    //MARK: - Navigationbar Titles
    struct NavigationbarTitles {
        static let kFollowRequest                               = "Follow Request"
        static let kEditSnippet                                 = "Edit Snippet"
    }

    //MARK: - API Failure messages
    struct FailureMessage {
        static let kNoInternetConnection                        = "Please check your internet connection"
        static let kCommanErrorMessage                          = "Something went wrong. please try again later"
        static let kDataNotFound                                = "No Result Found"
    }


    struct Labels {
        //Alert Buttom
        static let kLIST                                          = "LIST"
        static let kGRID                                          = "GRID"
    }
    //MARK: - Button
    struct Buttons {
        //Alert Buttom
        static let kNo                                          = "No"
        static let kYes                                         = "Yes"
        static let kCancel                                      = "Cancel"
    }

    //MARK: - ConstantString
    struct ConstantString {
        static let kEmailRegex                  = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{1,}(\\.[A-Za-z]{1,}){0,}"
    }
}

///`ImageName`
extension Constant {
    struct Image {
        static let kAppLogo                                      = "AppLogo"
        static let kBackArrow                                    = "BackArrow"
        static let kCheckboxSelected                             = "checkboxSelected"
        static let kCheckboxUnSelected                           = "checkboxUnselected"
        static let kCheckmark                                    = "checkmark"
        static let kSplash                                       = "Splash"
        static let kEyeClose                                     = "eyeClose"
        static let kEyeOpen                                      = "eyeOpen"
        static let kBookFill                                     = "book.fill"
        static let kBook                                         = "Book"
        static let kbookMarkFill                                 = "bookmark.fill"
        static let kXMarkCircle                                  = "xmark.circle"
        static let kStar                                         = "Star"
        static let kSigma                                         = "Sigma"

        static let kBGAuth                                       = "BGAuth"
        static let kBGLogin                                      = "BGLogin"
        static let kBGHome                                       = "BGHome"
        static let kAppleLogo                                    = "AppleLogo"
        static let kMetaLogo                                     = "MetaLogo"
        static let kLoginEmail                                   = "LoginEmail"
        static let kLoginPassword                                = "LoginPassword"
        static let kLoginBackButton                              = "LoginBackButton"
        static let kSignUpEmail                                  = "SignUpEmail"
        static let kBGSelectInterest                             = "BGSelectInterest"
        static let kBGForgotPassword                             = "BGForgotPassword"
        static let kBGForgotPasswordNew                          = "BGForgotPasswordNew"
        static let kBrowser                                      = "Browser"
        static let kFaceBook                                     = "FaceBook"
        static let kInstagram                                    = "Instagram"
        static let kLocation                                     = "Location"
        static let kPhoneIcon                                    = "PhoneIcon"
        static let kUploadLogo                                   = "UploadLogo"
        static let kEditIcon                                     = "EditIcon"
        static let kBGSideMenu                                   = "BGSideMenu"
        static let kArrowRight                                   = "ArrowRight"
        static let kHome                                         = "Home"
        static let kLocationHome                                 = "LocationHome"
        static let kMessages                                     = "Messages"
        static let kMessagesNew                                  = "MessagesNew"
        static let kExplore                                      = "Explore"
        static let kProfileHome                                  = "ProfileHome"
        static let kSearchbarIcon                                = "SearchbarIcon"
        static let kBottomLayer                                  = "BottomLayer"
        static let kEarlyofferBackground                         = "EarlyofferBackground"
        static let kBirdOfferLogo                                = "BirdOfferLogo"
        static let kCancelButton                                 = "CancelButton"
        static let kSubscriptionSuccessful                       = "SubscriptionSuccessful"
        static let kSelectedCheckBox                             = "SelectedCheckBox"
        static let kCheckBox                                     = "CheckBox"
        static let kBackgroundImage                              = "BackgroundImage"
        static let kBackgroundBottomLayer                        = "BackgroundBottomLayer"
        static let kChildFriendly                                = "puzzlepiece"
        static let kCardAccepted                                 = "creditcard"
        static let kWifi                                         = "wifi"
        static let kPetAllowed                                   = "pawprint"
        static let kAccessibleforpeoplewithdisabilities         = "figure.roll"
        static let kMessageHome                                  = "MessageHome"
        static let kSetting                                      = "Setting"
        static let kProfileSave                                  = "ProfileSave"
        static let kLocationImg                                  = "LocationSearch"
        static let kCurrentLocation                              = "CurrentLocation"
        static let kAppSymbol                                    = "AppSymbol"
        static let kDeleteIcon                                   = "DeleteIcon"
        static let kAddIcon                                      = "AddIcon"
        static let kBackgroundBottomLeadingLayer                = "BackgroundBottomLeadingLayer"
        static let kReply                                        = "Reply"
        static let kSend                                         = "Send"
        static let kDropdownActive                               = "DDActive"
        static let kDropdownInActive                             = "DDInActive"
        static let kMobileIcon                                   = "iphone.gen1"
        static let kSelectedIcon                                 = "SelectedIcon"
        static let kUnSelectedIcon                               = "UnSelectedIcon"
        static let kSaveIcon                                     = "SaveIcon"
        static let kShare                                        = "Share"
        static let kReviews                                      = "Reviews"
        static let kPasswordUnHidden                             = "PasswordUnHidden"
        static let kShowPassword                                 = "ShowPassword"
        static let kHidePassword                                 = "HidePassword"
        static let kUnSaveIcon                                   = "UnSaveIcon"
        static let kFilterIcon                                   = "FilterIcon"
        static let kSortIcon                                     = "SortIcon"
        static let kTagsIcon                                     = "TagsIcon"


    }
}

///`FontSize`
extension Constant {
    struct FontSize {

        static let _9FontSize: CGFloat                  = DeviceType.IsDeviceIPad ? 15 : 9
        static let _10FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 16 : 10
        static let _11FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 17 : 11
        static let _12FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 18 : 12
        static let _13FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 19 : 13
        static let _14FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 20 : 14
        static let _15FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 21 : 15
        static let _16FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 22 : 16
        static let _17FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 23 : 17
        static let _18FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 24 : 18
        static let _20FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 26 : 20
        static let _22FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 28 : 22
        static let _25FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 31 : 25
        static let _28FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 34 : 28
        static let _30FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 36 : 30
        static let _33FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 39 : 33
        static let _34FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 44 : 34
        static let _48FontSize: CGFloat                 = DeviceType.IsDeviceIPad ? 54 : 48

        static let defaultFontSize: CGFloat             = DeviceType.IsDeviceIPad ? 22 : 16
        static let headerSize: CGFloat                  = DeviceType.IsDeviceIPad ? 38 : 34
        static let navTitleFontSize: CGFloat            = DeviceType.IsDeviceIPad ? 34 : 30
        static let calendarFontSize: CGFloat            = DeviceType.IsDeviceIPad ? 23 : 17
    }
}

///`setFrame`
extension Constant {
    struct setFrame {
        static let _1Size: CGFloat                     = DeviceType.IsDeviceIPad ? 2.0 : 1.0
        static let _2Size: CGFloat                     = DeviceType.IsDeviceIPad ? 4.0 : 2.0
        static let _5Size: CGFloat                     = DeviceType.IsDeviceIPad ? 10.0 : 5.0
        static let _8Size: CGFloat                     = DeviceType.IsDeviceIPad ? 16.0 : 8.0
        static let _9Size: CGFloat                     = DeviceType.IsDeviceIPad ? 19.0 : 9.0
        static let _10Size: CGFloat                    = DeviceType.IsDeviceIPad ? 20.0 : 10.0
        static let _12Size: CGFloat                    = DeviceType.IsDeviceIPad ? 22.0 : 12.0
        static let _14Size: CGFloat                    = DeviceType.IsDeviceIPad ? 24.0 : 14.0
        static let _15Size: CGFloat                    = DeviceType.IsDeviceIPad ? 25.0 : 15.0
        static let _17Size: CGFloat                    = DeviceType.IsDeviceIPad ? 27.0 : 17.0
        static let _18Size: CGFloat                    = DeviceType.IsDeviceIPad ? 28.0 : 18.0
        static let _19Size: CGFloat                    = DeviceType.IsDeviceIPad ? 29.0 : 19.0
        static let _20Size: CGFloat                    = DeviceType.IsDeviceIPad ? 40.0 : 20.0
        static let _21Size: CGFloat                    = DeviceType.IsDeviceIPad ? 31.0 : 21.0
        static let _23Size: CGFloat                    = DeviceType.IsDeviceIPad ? 33.0 : 23.0
        static let _24Size: CGFloat                    = DeviceType.IsDeviceIPad ? 34.0 : 24.0
        static let _25Size: CGFloat                    = DeviceType.IsDeviceIPad ? 35.0 : 25.0
        static let _26Size: CGFloat                    = DeviceType.IsDeviceIPad ? 36.0 : 26.0
        static let _27Size: CGFloat                    = DeviceType.IsDeviceIPad ? 31.0 : 27.0
        static let _28Size: CGFloat                    = DeviceType.IsDeviceIPad ? 38.0 : 28.0
        static let _30Size: CGFloat                    = DeviceType.IsDeviceIPad ? 40.0 : 30.0
        static let _34Size: CGFloat                    = DeviceType.IsDeviceIPad ? 50.0 : 34.0
        static let _35Size: CGFloat                    = DeviceType.IsDeviceIPad ? 45.0 : 35.0
        static let _40Size: CGFloat                    = DeviceType.IsDeviceIPad ? 50.0 : 40.0
        static let _44Size: CGFloat                    = DeviceType.IsDeviceIPad ? 54.0 : 44.0
        static let _49Size: CGFloat                    = DeviceType.IsDeviceIPad ? 59.0 : 49.0
        static let _50Size: CGFloat                    = DeviceType.IsDeviceIPad ? 60.0 : 50.0
        static let _52Size: CGFloat                    = DeviceType.IsDeviceIPad ? 104.0 : 52.0
        static let _55Size: CGFloat                    = DeviceType.IsDeviceIPad ? 65.0 : 55.0
        static let _60Size: CGFloat                    = DeviceType.IsDeviceIPad ? 70.0 : 60.0
        static let _66Size: CGFloat                    = DeviceType.IsDeviceIPad ? 76.0 : 66.0
        static let _70Size: CGFloat                    = DeviceType.IsDeviceIPad ? 80.0 : 70.0
        static let _72Size: CGFloat                    = DeviceType.IsDeviceIPad ? 82.0 : 72.0
        static let _75Size: CGFloat                    = DeviceType.IsDeviceIPad ? 85.0 : 75.0
        static let _79Size: CGFloat                    = DeviceType.IsDeviceIPad ? 89.0 : 79.0
        static let _80Size: CGFloat                    = DeviceType.IsDeviceIPad ? 90.0 : 80.0
        static let _84Size: CGFloat                    = DeviceType.IsDeviceIPad ? 94.0 : 84.0
        static let _90Size: CGFloat                    = DeviceType.IsDeviceIPad ? 100.0 : 90.0
        static let _100Size: CGFloat                   = DeviceType.IsDeviceIPad ? 110.0 : 100.0
        static let _120Size: CGFloat                   = DeviceType.IsDeviceIPad ? 140.0 : 120.0
        static let _142Size: CGFloat                   = DeviceType.IsDeviceIPad ? 172.0 : 142.0
        static let _180Size: CGFloat                   = DeviceType.IsDeviceIPad ? 200.0 : 180.0
        static let _200Size: CGFloat                   = DeviceType.IsDeviceIPad ? 220.0 : 200.0


        static let _50SizeLarge: CGFloat                    = DeviceType.IsDeviceIPad ? 100.0 : 50.0

        static let _NavigationItemSize: CGFloat        = DeviceType.IsDeviceIPad ? 40.0 : 30.0
        static let _EditIconSize: CGFloat              = DeviceType.IsDeviceIPad ? 30.0 : 20.0

    }
}


///`setSpace`
extension Constant {
    struct setSpace {
        static let _0_5Padding: CGFloat                 = DeviceType.IsDeviceIPad ? 1 : 0.5
        static let _2Padding: CGFloat                   = DeviceType.IsDeviceIPad ? 4 : 2
        static let _3Padding: CGFloat                   = DeviceType.IsDeviceIPad ? 6 : 3
        static let _4Padding: CGFloat                   = DeviceType.IsDeviceIPad ? 8 : 4
        static let _5Padding: CGFloat                   = DeviceType.IsDeviceIPad ? 10 : 5
        static let _6Padding: CGFloat                   = DeviceType.IsDeviceIPad ? 12 : 6
        static let _7Padding: CGFloat                   = DeviceType.IsDeviceIPad ? 14 : 7
        static let _8Padding: CGFloat                   = DeviceType.IsDeviceIPad ? 16 : 8
        static let _9Padding: CGFloat                   = DeviceType.IsDeviceIPad ? 18 : 9
        static let _10Padding: CGFloat                  = DeviceType.IsDeviceIPad ? 20 : 10
        static let _12Padding: CGFloat                  = DeviceType.IsDeviceIPad ? 24 : 12
        static let _14Padding: CGFloat                  = DeviceType.IsDeviceIPad ? 28 : 14
        static let _16Padding: CGFloat                  = DeviceType.IsDeviceIPad ? 32 : 16
        static let _18Padding: CGFloat                  = DeviceType.IsDeviceIPad ? 36 : 18
        static let _20Padding: CGFloat                  = DeviceType.IsDeviceIPad ? 40 : 20
        static let _25Padding: CGFloat                  = DeviceType.IsDeviceIPad ? 50 : 25
        static let _30Padding: CGFloat                  = DeviceType.IsDeviceIPad ? 60 : 30
        static let _36Padding: CGFloat                  = DeviceType.IsDeviceIPad ? 72 : 36
        static let _48Padding: CGFloat                  = DeviceType.IsDeviceIPad ? 96 : 48
        static let _50Padding: CGFloat                  = DeviceType.IsDeviceIPad ? 100 : 50
        static let _60Padding: CGFloat                  = DeviceType.IsDeviceIPad ? 120 : 60
    }
}

///`AppString`
extension Constant {
    struct AppString {
        static let kMedBook                                         = "MedBook"
        static let kWelcome                                         = "Welcome"
        static let kSignup                                          = "Signup"
        static let kLogin                                           = "Login"
        static let kEmail                                           = "Email"
        static let kPassword                                        = "Password"
        static let kAtLeast8Characters                              = "At least 8 characters"
        static let kContainsASpecialCharacter                       = "Contains a special character"
        static let kMustContainAnUppercaseLetter                    = "Must contain an uppercase letter"
        static let kLetsGo                                          = "Let's go"
        static let kSignUpToContinue                                = "sign up to continue"
        static let kLoginToContinue                                 = "log in to continue"
        static let OK                                               = "OK"
        static let kWhichTopics                                     = "Which topic interests\n you today?"
        static let kBookMarks                                       = "BookMarks"
    }
}

///`ErrorMessageString`
extension Constant {
    struct ErrorMessageString {
        static let kEmptyEmail: String                              = "Please enter email address."
        static let kEmptyPassword: String                           = "Please enter password."
        static let kEmptyConfirmPassword: String                    = "Please enter confirm password."
        static let kEmptyName: String                               = "Please enter name."
        static let kEmptyCompanyName: String                        = "Please enter company name."
        static let kEmptyLocation: String                           = "Please enter location."
        static let kEmptyPhoneNumber: String                        = "Please enter phone number."
        static let kValidPhoneNumber: String                        = "Please enter valid phone number."
        static let kEmptyWebsiteLink: String                        = "Please enter website link."
        static let kValidWebsiteLink: String                        = "Please enter valid link."
        static let kEmptyFacebookURL: String                        = "Please enter facebook URL."
        static let kValidFacebookURL: String                        = "Please enter valid facebook URL."
        static let kEmptyInstagramURL: String                       = "Please enter instagram URL."
        static let kValidInstagramURL: String                       = "Please enter valid instagram URL."
        static let kEmptyAbout: String                              = "Please write something about your organisation."
        static let kPasswordDoesNotMatch: String                    = "Password does not match."
        static let kValidEmail: String                              = "Please enter valid email address."
        static let kValidPasswordLength: String                     = "Your password must be at least 8 characters."
        static let kValidPassword: String                           = "Your password must contains atleast one capital & special character."
        static let kInvalidOTP: String                              = "Invalid OTP."
        static let kPleaseEnterOTP: String                          = "Please enter OTP."
        static let kPleaseSelect1Tags: String                       = "Please select atleast one tag."
        static let kPleaseSelectAtLeastOneAmenities: String         = "Please select at least one amenities."
        static let kPleaseSelect1Interest: String                   = "Please select atleast one interest."
        static let k5InterestAreAlreadySelected: String             = "Select maximum 5 tags only"
        static let k3ServicesAreAlreadySelected: String             = "Select maximum 3 tags only."
        static let kPleaseSelect1Image: String                      = "Please select atleast 1 image."
        static let kCancelledLoginAttempt: String                   = "Cancelled login attempt."
        static let kLogoutAlert: String                             = "Are you sure you want to logout?"
        static let kEmptyServiceName: String                        = "Please enter service name."
        static let kDeleteServiceAlert: String                      = "Are you sure you want to delete service?"
        static let kDeleteService: String                           = "Service deleted successfully."
        static let kEmptyDescription: String                        = "Please enter description."
        static let kEmptyPrice: String                              = "Please enter price."
        static let kValidPrice: String                              = "Please enter valid price."
        static let kSuccessFullyUpdated: String                     = "Profile updated successfully."
        static let kCloseTimeMustBeGreaterThanStartTime: String     = "Close time must be greater than start time."
        static let kPleaseSelectAReviewFirst: String                = "Please select a review first."
        static let kPleaseAddReviewText: String                     = "Please type something..."
        static let kAreYouSureDeleteComment: String                 = "Are you sure you want to delete this comment."
    }
}

///`NavBarTitle`
extension Constant {
    struct NavBarTitle {
        static let kRegister: String                                = "Register:"
        static let kSelectInterests: String                         = "Select interests:"
        static let kSelectTags: String                              = "Select tags:"
        static let kForgotPassword: String                          = "Forgot Password:"
        static let kOTPVerification: String                         = "OTP Verification:"
        static let kCreateNewPassword: String                       = "Create new password:"
        static let kReviews                                         = "Reviews"
    }
}

extension Constant {
    struct ErrorMessages {
        static let kNoInternetConnection        = "Please check your internet connection."
        static let kCommanErrorMessage          = "Something went wrong. Please try again later."
        static let kSessionExpired              = "Session expired. Please login again."
    }
}

///`kNumbersInterestAreAlreadySelected`
extension Constant.ErrorMessageString {
    static func kNumbersInterestAreAlreadySelected(_ num: Int) -> String {
        if num == 5 {
            return Constant.ErrorMessageString.k5InterestAreAlreadySelected
        } else {
            return Constant.ErrorMessageString.k3ServicesAreAlreadySelected
        }
    }
}

