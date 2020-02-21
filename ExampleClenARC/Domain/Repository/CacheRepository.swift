//
//  CacheRepository.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 12/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation
protocol CacheRepository{
    func retrieve<T>(fromKey key: String) -> T? where T : Codable
}
