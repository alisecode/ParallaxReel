//
//  GuitarCard.swift
//  ParallaxReel
//
//  Created by Alise Serhiienko on 07.12.2023.
//

import SwiftUI

struct GuitarCard: Identifiable, Hashable {
    var id: UUID = .init()
    var image: String
}

var guitarCards: [GuitarCard] = [
    .init(image: "pic1"),
    .init(image: "pic2"),
    .init(image: "pic3"),
    .init(image: "pic4"),
    .init(image: "pic5")
]
