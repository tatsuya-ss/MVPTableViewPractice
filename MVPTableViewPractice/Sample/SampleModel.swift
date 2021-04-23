//
//  File.swift
//  MVPTableViewPractice
//
//  Created by 坂本龍哉 on 2021/04/22.
//

import Foundation

protocol SampleModelInput {
    func change(query: String, completion: @escaping (Result<String, Error>) -> ())
}

final class SampleModel: SampleModelInput {
    func change(query: String, completion: @escaping (Result<String, Error>) -> ()) {
        let change = "[\(query)]"
        completion(.success(change))
    }
}
