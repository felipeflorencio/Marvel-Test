//
//  CharacterItem.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import UIKit

struct CharacterItem: Equatable {
    private(set) var model: MarvelCharacter

    var imageURL: URL? { model.thumbnail?.url }
    var name: String { model.name.defaultIfEmpty }
    var description: String { model.description.defaultIfEmpty }
    var nameTitle: String { L10n.Character.name }
    var descriptionTitle: String { L10n.Character.description }

    init(_ model: MarvelCharacter) {
        self.model = model
    }
}
