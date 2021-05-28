//
//  DataImage.swift
//  CloneInsta
//
//  Created by Florian  on 26/05/2021.
//

import Foundation

struct Post: Identifiable {
    var id = UUID()
    let author: People
    let imageName: String
    let localisation : String
    let comment : String
    let likes : Int
    
    
    static var all = [
        Post(author: People.all[0], imageName: "p1", localisation :"Italia", comment: "Dolce Vita, a colorful city❤️ ",  likes : 34 ),
        Post(author: People.all[1], imageName: "p2",localisation : "Corsica", comment: "motorcycle tour of Corsica", likes :53),
        Post(author: People.all[2], imageName: "p3", localisation : "Russia", comment: "beautiful frozen lake", likes :312),
        Post(author: People.all[3], imageName: "p4", localisation :"Bresil(Amazonie)", comment: "kayak trip on the river ", likes :42),
        Post(author: People.all[4], imageName: "p5", localisation :"San Fransisco", comment: "Dear San Fransisco",  likes :97),
        Post(author: People.all[5], imageName: "p6", localisation :"Island", comment: "Like a Dream",  likes :87),
        Post(author: People.all[6], imageName: "p0", localisation :"wild Wild West", comment: "Me.", likes : 41)
    ]
}
