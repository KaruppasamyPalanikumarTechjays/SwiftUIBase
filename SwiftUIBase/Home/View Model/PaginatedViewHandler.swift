//
//  PaginatedViewHandler.swift
//  SwiftUIBase
//
//  Created by Karuppasamy Palanikumar on 31/10/22.
//

import Foundation
import TechjaysAPIHelper

class PaginatedViewHandler<T:Identifiable & Codable> {
    
    private
    let url: String
    
    private
    var isLoading: Bool = false
    
    private
    var offset: Int = 0
    
    private
    let limit: Int = 10
    
    private
    var hasNext: Bool = true
    
    var result: [T] = []
    
    private
    var params: [String:String] = [:]
    
    init(with url:String,
         params: [String:String] = [:]) {
        self.url = url
    }
    
    func fetchData(
        from start:Bool = true,
        fetched: @escaping(() -> Void)) {
        if start { self.offset = 0 ; self.hasNext = true }
        self.getDetails(isStart: start, fetched: fetched)
    }
    
    private
    func getDetails(isStart: Bool,fetched: @escaping(() -> Void)) {
        guard hasNext && !isLoading else { return }
        self.isLoading = true
        let resultUrl = URLFactory().url(
            endpoint: self.url,
            query: [.offset : "\(self.offset)",
                    .limit : "\(self.limit)"],
            parameters: ["search_type":"all"])
        APIClient().GET(
            url: resultUrl,
            headers: ["Authorization":"Token 96fb85ed49769a7b866024c799b4ef2771933268"]) { (status, response:APIResponse<[T]>) in
                switch status {
                    case .SUCCESS:
                        if let next = response.nextLink,
                           next {
                            self.hasNext = next
                            if isStart {
                                self.result.removeAll()
                                if let data = response.data {
                                    self.result = data
                                    self.offset += self.limit
                                    self.isLoading = false
                                    fetched()
                                }
                            } else {
                                if let data = response.data {
                                    self.result.append(contentsOf: data)
                                    self.offset += self.limit
                                    self.isLoading = false
                                    fetched()
                                }
                            }
                        }
                    case .FAILURE:
                        self.hasNext = false
                        self.isLoading = false
                        fetched()
                }
            }
    }
    
}
