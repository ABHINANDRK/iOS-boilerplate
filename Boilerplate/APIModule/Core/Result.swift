//
//  Result.swift
//  Boilerplate
//
//  Created by Abhinand on 02/11/21.
//

import Foundation
import Moya
import UIKit

extension Result where Success == Moya.Response, Failure == MoyaError{
    func parseResponse<R: Decodable>(_: R.Type, success: (R) -> Void, failure: (APIResponseError) -> Void) {
        do {
            let apiResponse = try get()
                .filterSuccessfulStatusAndRedirectCodes()
                .map(R.self)
            
            success(apiResponse)
            
        } catch {
            failure(.apiError(from: error))
        }
    }
}
