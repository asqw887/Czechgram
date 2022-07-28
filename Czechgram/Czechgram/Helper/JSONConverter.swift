//
//  JSONConverter.swift
//  Czechgram
//
//  Created by juntaek.oh on 2022/07/20.
//

import Foundation
import RxSwift

struct JSONConverter<T: Codable> {

    typealias Model = T

    func decode(data: Data) -> Single<Model> {
        Single<Model>.create { observer -> Disposable in
            guard let json = try? JSONDecoder().decode(Model.self, from: data) else {
                observer(.failure(NetworkError.decodingError))
                return Disposables.create()
            }
            
            observer(.success(json))
            return Disposables.create()
        }
        
//        do {
//            let decodedData = try JSONDecoder().decode(Model.self, from: data)
//            return decodedData
//        } catch {
//            print(NetworkError.decodingError(error))
//            return nil
//        }
    }

    func encode(model: Model) -> Single<Data> {
        Single<Data>.create { observer -> Disposable in
            guard let data = try? JSONEncoder().encode(model) else {
                observer(.failure(NetworkError.encodingError))
                return Disposables.create()
            }
            
            observer(.success(data))
            return Disposables.create()
        }
        
//        do {
//            let encodedData = try JSONEncoder().encode(model)
//            return encodedData
//        } catch {
//            print(NetworkError.encodingError(error))
//            return nil
//        }
    }
}
