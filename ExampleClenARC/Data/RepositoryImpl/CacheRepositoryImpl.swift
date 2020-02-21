//
//  CacheRepositoryImpl.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 12/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation
public class CacheRepositoryImpl: CacheRepository {
    private let cacheService = CacheService()

    public func retrieve<T>(fromKey key: String) -> T? where T : Codable{
        return cacheService.retrieve(fromKey: key)
    }

}
