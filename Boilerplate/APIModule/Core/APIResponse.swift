//
//  APIResponse.swift
//  Boilerplate
//
//  Created by Abhinand on 02/11/21.
//

import Foundation
import Moya

/// - NOTE: Sample API Response
/*
 {
     "errors" : null,
     "data" : {
         "version" : "1.0.2",
         "updateMessage" : "To continue using the app please install the latest version.",
         "forceUpdate" : "false",
         "showUpdatePopup" : "true",
         "lastSupportedVersion" : "1.0.0"
     },
     "message" : "OK",
     "meta" : {
         "took" : 0,
         "total" : 1,
         "length" : 1
     }
 }*/

/// Generic  API Response
struct APIResponse<Data: Decodable>: Decodable {
    var errors: APIResponseError?
    var data: Data?
    var message: String?
}

/// Generic CoLearn API Error
struct APIResponseError: Error, Decodable {
    /// parsed from API response
    var code: String?

    /// parsed from API response
    var status: Int = 0

    /// parsed from API response
    var errorCode: String?

    /// parsed from API response
    var service: String?

    /// generally, parsed from API response
    var message: String?

    /// http response status code, 0 if not known
    var httpStatus: Int = 0

    /// error type
    var kind: ErrorKind = .unknown

    var underlyingError: Error?

    enum ErrorKind: Int, Codable {
        /// device is offline <br>
        /// api call was not made
        case offline

        /// response parsing error
        case parsingError

        /// invalid request <br>
        /// something wrong with request or request parameters <br>
        /// api call was not made
        case requestParsingError

        /// error parsed from api<br>
        /// error message and code most probably came from API response
        case apiError

        /// unknown
        case unknown
    }

    enum APIErrorKey: CodingKey {
        case code
        case status
        case errorCode
        case service
    }

    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: APIErrorKey.self)

        code = try? container?.decodeIfPresent(String.self, forKey: .code)
        status = (try? container?.decodeIfPresent(Int.self, forKey: .status)) ?? 0
        errorCode = try? container?.decodeIfPresent(String.self, forKey: .errorCode)
        service = try? container?.decodeIfPresent(String.self, forKey: .service)
    }

    init(code: String? = nil,
         status: Int = 0,
         errorCode: String? = nil,
         service: String? = nil,
         message: String? = nil,
         httpStatus: Int = 0,
         kind: ErrorKind = .unknown,
         underlyingError: Error? = nil)
    {
        self.code = code
        self.status = status
        self.errorCode = errorCode
        self.service = service

        self.message = message
        self.httpStatus = httpStatus
        self.kind = kind

        self.underlyingError = underlyingError
    }
}

extension APIResponseError {
    static func apiError(from error: Error) -> APIResponseError {
        guard let moyaError = error as? MoyaError else {
            if let apiError = error as? APIResponseError {
                return apiError
            } else {
                return APIResponseError(message: error.localizedDescription, kind: .unknown, underlyingError: error)
            }
        }

        switch moyaError {
        case let .imageMapping(response),
             let .jsonMapping(response),
             let .stringMapping(response),
             let .objectMapping(_, response):

            return APIResponseError(httpStatus: response.statusCode,
                                    kind: .parsingError,
                                    underlyingError: moyaError)

        case .encodableMapping(_),
             .requestMapping(_),
             .parameterEncoding:

            return APIResponseError(message: "Invalid Request",
                                    kind: .requestParsingError,
                                    underlyingError: moyaError)

        case let .statusCode(httpResponse):

            let apiResponse = try? httpResponse.map(APIResponse<Data>.self)

            if var error = apiResponse?.errors {
                error.message = apiResponse?.message
                error.httpStatus = httpResponse.statusCode
                error.kind = .apiError
                error.underlyingError = moyaError

                return error
            } else {
                return APIResponseError(message: apiResponse?.message,
                                        httpStatus: httpResponse.statusCode,
                                        kind: .apiError,
                                        underlyingError: moyaError)
            }

        case let .underlying(error, response):

            if var apiError = error as? APIResponseError {
                apiError.httpStatus = response?.statusCode ?? 0
                return apiError

            } else {
                return APIResponseError(httpStatus: response?.statusCode ?? 0,
                                        kind: .unknown,
                                        underlyingError: error)
            }
        }
    }
}
