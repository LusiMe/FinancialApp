//
//  URLSessionExtencion.swift
//  TradingApp
//
//  Created by Luda Parfenova on 06/04/2022.
//

import Foundation

extension URLSession {
    func dataTask(with request: URLRequest, resultHandler: @escaping(BalanceResult) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: request) { data, responce, error in
            if let networkError = NetworkError(data: data, response: responce, error: error) {
                resultHandler(.failure(networkError))
                return
            }
            resultHandler(.success(data!))
        }
    }
}

typealias BalanceResult = Result<Data, NetworkError>

