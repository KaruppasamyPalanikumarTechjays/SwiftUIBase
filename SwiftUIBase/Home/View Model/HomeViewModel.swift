//
//  HomeViewModel.swift
//  SwiftUIBase
//
//  Created by Karuppasamy Palanikumar on 31/10/22.
//

import Foundation
import SwiftUI
import TechjaysAPIHelper

class HomeViewModel: ObservableObject {
    
    @Published var result: [VidRivalUser] = []

    var resultValue:PaginatedViewHandler<VidRivalUser> = PaginatedViewHandler(with: "https://dev-myvidrivals.myvidhire.com/api/v1/friends-app/friends-list/")
    
    init() {
        resultValue.fetchData(from: true) {
            self.result = self.resultValue.result
        }
    }
    
    func getMoreData(currentData: VidRivalUser) {
        if currentData.id == self.result.last?.id {
            resultValue.fetchData(from: false) {
                self.result = self.resultValue.result
            }
        }
    }
    
}
