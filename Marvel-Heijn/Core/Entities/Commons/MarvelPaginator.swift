//
//  MarvelPaginator.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Foundation

struct Paginator<Value: Entity>: Entity {
    private(set) var offset: Int
    private(set) var limit: Int
    private(set) var total: Int
    private(set) var count: Int
    private(set) var results: [Value]

    init(
        offset: Int = 0,
        limit: Int = 0,
        total: Int = 0,
        count: Int = 0,
        results: [Value]
    ) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }

    var hasMorePages: Bool {
        total - (offset + limit) > 0
    }

    var nextOffset: Int {
        hasMorePages ? offset + limit : offset
    }
}
