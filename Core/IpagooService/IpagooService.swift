//
//  IpagoService.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import RxSwift

public enum IpagooServiceError: Error {
    case resourceNotFound
    case couldNotDecodeJSON
}

final internal class IpagooService {
    private let decoder = JSONDecoder()
    
    func load<T>(_ type: T.Type, from endpoint: Endpoint) -> Observable<T> where T:Decodable {
        let decoder = self.decoder
        
        return data(for: endpoint.path)
            .map{ try decoder.decode(T.self, from: $0)}
            .catchError{ error in
                print("error: \(error)")
                throw error
            }
    }
}

private extension IpagooService {
    func data(for resource: String) -> Observable<Data> {
        return Observable.create { observer in
            let bundle = Bundle(for: type(of: self))
            if let file = bundle.url(forResource: resource, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: file)
                    observer.onNext(data)
                    observer.onCompleted()
                } catch {
                    
                }
            } else {
                observer.onError(IpagooServiceError.resourceNotFound)
            }
            
            return Disposables.create()
        }
    }
}
