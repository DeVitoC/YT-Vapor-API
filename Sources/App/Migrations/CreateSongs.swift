//
//  CreateSongs.swift
//  
//
//  Created by Christopher DeVito on 2/7/22.
//

import Fluent

struct CreateSongs: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("songs")
            .id()
            .field("title", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("songs").delete()
    }
}
