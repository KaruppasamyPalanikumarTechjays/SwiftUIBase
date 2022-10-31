//
//  LoginViewModel.swift
//  SwiftUIBase
//
//  Created by Karuppasamy Palanikumar on 31/10/22.
//

import Foundation
import TechjaysAPIHelper
import SwiftUI

class LoginViewModel: ObservableObject {
    typealias CompletionHandler = (_ status: APIClient.Status, _ response: VidRivalUser) -> Void
    @Published var result = VidRivalUser()
    func userProfile(url: String, completion: @escaping CompletionHandler) {
        APIClient().GET(url: URLFactory().url(endpoint: url)) { (status, response: APIResponse<VidRivalUser>) in
            switch status {
                case .SUCCESS:
                    if let data = response.data {
                        completion(.SUCCESS, data)
                    }
                case .FAILURE:
                    completion(.FAILURE, VidRivalUser(msg: response.msg))
            }
        }
    }
    func viewUserProfile() {
        self.userProfile(url: "users/myprofile/", completion: {status, response in
            switch status {
                case .SUCCESS:
                    print(response)
                    self.result = response
                case .FAILURE:
                    print("Failure")
            }
        })
    }
}




