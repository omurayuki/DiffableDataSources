//
//  Country.swift
//  DiffableDataSourcesProject
//
//  Created by オムラユウキ on 2019/12/17.
//  Copyright © 2019 オムラユウキ. All rights reserved.
//

import Foundation

struct Country: Hashable {
    let name: String
    let identifier = UUID()

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    static func ==(lhs: Country, rhs: Country) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    func contains(query: String?) -> Bool {
        guard let query = query else { return true }
        guard !query.isEmpty else { return true }
        let lowerCasedQuery = query.lowercased()
        return name.lowercased().contains(lowerCasedQuery)
    }
}
