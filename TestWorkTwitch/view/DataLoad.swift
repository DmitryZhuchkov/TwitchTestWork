//
//  DataLoad.swift
//  TestWorkTwitch
//
//  Created by Дмитрий Жучков on 30.01.2021.
//

import Foundation
import Alamofire
class DataLoad {
    typealias dataCallBack = (_ resultData:JSONData?) -> Void
    var callBack: dataCallBack?
    init() {
    }
    func getData() {
        var headers = HTTPHeaders()
        headers = [ "Accept":"application/vnd.twitchtv.v5+json",
                        "Client-ID":"sd4grh0omdj9a31exnpikhrmsu3v46"]
        AF.request("https://api.twitch.tv/kraken/games/top", method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                           self.callBack?(nil)
                           return
                
            }
                       do {
                       let JsonData = try JSONDecoder().decode(JSONData.self, from: data)
                           self.callBack?(JsonData)
                       } catch {
                           self.callBack?(nil)
                       }
        }
    }
    func completionHandler(callBack: @escaping dataCallBack) {
              self.callBack = callBack
    }
}
