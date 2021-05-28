//
//  People.swift
//  CloneInsta
//
//  Created by Florian  on 26/05/2021.
//

import Foundation

struct People: Identifiable {
    var id = UUID()
    let name : String
    let imageName : String
    
    static var all = [
    People(name: "Angelina Jolie", imageName: "AngelinaJolie"),
    People(name: "George Clooney", imageName: "GeorgeClooney"),
    People(name: "Monica Belluci", imageName: "MonicaBelluci"),
    People(name: "Tom Cruise", imageName: "TomCruise"),
    People(name: "Tom Hanks", imageName: "TomHanks"),
    People(name: "Natalie Portman", imageName: "NataliePortman"),
    People(name: "Will Smith", imageName: "WillSmith")]
    
}

