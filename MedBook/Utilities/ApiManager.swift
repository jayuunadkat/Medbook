//
//  ApiManagers.swift
//  WhosNext
//
//  Created by differenz195 on 01/09/22.
//

import SwiftUI
import SystemConfiguration
import Alamofire
import Combine
import Network

enum APIManagerKey {
    static let IsSuccess = "success"
    static let StatusCode = "status_code"
    static let Message = "message"
    static let Data = "data"
}

public enum StatusCode: Int {
    case Success = 200
    case Unauthorized = 401
    case Fail = 402
    case InvalidConfiguration = 403
    case ListRefresh = 406
    case UserNotExist = 404
    case relationSuccess = 201
    case widgetRefresh = 408
}

class APIManager: NSObject {
    private var cancellableSet: Set<AnyCancellable> = []

    /**
     This method is used to check internet connectivity.
     - Returns: Return boolean value to indicate device is connected with internet or not
     */
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()

        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)

        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }

        var flags: SCNetworkReachabilityFlags = []

        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }

        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)

        return (isReachable && !needsConnection)
    }

    /**
     This method is used to make Alamofire request with or without parameters.
     - Parameters:
     - url: URL of request
     - method: HTTPMethod of request
     - parameter: Parameter of request
     - success: Success closure of method
     - response: Response object of request
     - failure: Failure closure of method
     - error: Failure error
     - connectionFailed: Network connection faild closure of method
     - error: Network error
     */
    class func makeRequest(with url: String, method: HTTPMethod, parameter: [String:Any]?, success: @escaping (_ response: Any) -> Void, failure: @escaping (_ error: String,_ errorcode: Int, _ isAuth: Bool) -> Void, connectionFailed: @escaping (_ error: String) -> Void) {

        if(isConnectedToNetwork()) {
            // Utilities.printLog(url)

            print(url)

            if let param = parameter, let data = try? JSONSerialization.data(withJSONObject: param, options: .prettyPrinted) {
                print(String(data: data, encoding: .utf8) ?? "Nil Param")
            }
            // let token = isHubModule ? GrowHub.sharedInstance.hubUser?.accessToken ?? "" : GrowHub.sharedInstance.currentUser?.accessToken ?? ""

//            let currentUser = UserDefaults.getData(UserDefaultsKey.kLoginUser, data: UserModel.self)?.data

            let headers = [
                Constant.content_type: "application/json",
//                Constant.Authorization: "Bearer \(currentUser?.authorization ?? "")",
            ] as [String: String]

            // Constant.Authorization: UserDefaults.getData(UserDefaultsKey.kLoginUser, data: UserModel.self)?.accessToken ?? ""
            // print(LetterMen.sharedInstance.currentUser?.access_token ?? "")

            let httpHeaders = HTTPHeaders.init(headers)
            print(headers)
            print("Method: \n",method.rawValue)

            AF.request(url, method: method, parameters: parameter, encoding: URLEncoding.default, headers: httpHeaders).responseData { response in
                guard let str = response.data?.prettyPrintedJSONString else { return }
                Logger.logResponse(ofAPI: url, logType: .info, object: str)

                switch response.result {
                case .success(let data):
                    // print("Response: \n", data.prettyPrintedJSONString ?? "nil")

                    if let res = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
                        let statusCode = response.response?.statusCode
                        let msg = res["message"] as? String ?? IdentifiableKeys.FailureMessage.kCommanErrorMessage
                        /// `accessToken invalid`
                        if statusCode == StatusCode.Success.rawValue {
                            /// `success`
                            let responseData = try? JSONSerialization.jsonObject(with: data, options: [])
                            success(responseData as AnyObject)
                        } else {
                            /// `failure`
                            if response.response?.statusCode == 401 {
                                failure(msg, 401, true)
                            } else {
                                failure(msg, response.response?.statusCode ?? 402, false)
                            }
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    if !error.localizedDescription.contains("cancelled") {
                        failure(IdentifiableKeys.FailureMessage.kCommanErrorMessage, 400, false)
                    }
                }
            }
        } else {
            Indicator.hide()
            failure(IdentifiableKeys.FailureMessage.kNoInternetConnection, 400, false)
        }
    }
}

struct IdentifiableKeys {
    //MARK: - API Failure messages
    struct FailureMessage {
        static let kNoInternetConnection                        = "Please check your internet connection"
        static let kCommanErrorMessage                          = "Something went wrong. please try again later"
        static let kDataNotFound                                = "No Result Found"
    }
}

///`appending`
extension URL {

    func appending(_ queryItem: String, value: String?) -> URL {

        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }

        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        // Create query item
        let queryItem = URLQueryItem(name: queryItem, value: value)

        // Append the new query item in the existing query items array
        queryItems.append(queryItem)

        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems

        // Returns the url from new url components
        return urlComponents.url!
    }
}
