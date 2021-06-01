//
//  ImageGrind.swift
//  CloneInsta
//
//  Created by Florian  on 31/05/2021.
//

import SwiftUI

struct  Item : Identifiable{
    let id = UUID()
    let title : String
    let image : String
    let imageColor : Color
}

struct ImagesGrind: View {
    
    
    let items = [ Item(title: "Chaussure Homme", image: "chaussure_homme1", imageColor: .blue),
                  Item(title: "Chaussure Femme", image: "chaussure_femme", imageColor: .pink),
                  Item(title: "Manteaux", image: "manteau", imageColor: .purple),
                  Item(title: "parfum", image: "parfum", imageColor: .yellow),
                  Item(title: "robe", image: "robe", imageColor: .gray),
                  Item(title: "accessoire", image: "accessoire", imageColor: .green),
                  Item(title: "Chapeaux", image: "chapeau", imageColor: .orange)
    ]
    
    var spacing : CGFloat = 10
    @State private var numberOfRow = Int.random(in: 1..<4)
    
    
    var body: some View {
        
        let columns = Array(repeating: GridItem(.flexible(),spacing: spacing), count: numberOfRow)
                            
                            
        ScrollView() {
            
            ProfilView
            
            
            LazyVGrid(columns: columns, spacing : spacing) {
                ForEach(items) { item in
                    Button(action : {}){
                    ItemView(item: item)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal)
            .offset(y: -50)
        }
        .background(Color.white)
        .ignoresSafeArea()
    }

    var ProfilView: some View{
        VStack{
            Image("flo")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.blue, lineWidth: 5))
                .onTapGesture {
                    numberOfRow = Int.random(in: 1..<4)
                }
            Text("Ma Boutique")
                .foregroundColor(.blue)
        }.frame(height : 350)
        .frame(maxWidth: .infinity)
        .background(Color.black)
    }
}




struct ItemView: View{
    
    let item : Item
    
    var body: some View{
        GeometryReader{ reader in
            VStack(spacing : 5){
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width : 50)
                Text(item.title)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black.opacity(0.9))
            }
            .frame(width: reader.size.width, height: reader.size.height)
            .background(item.imageColor)
        }
        .frame(height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
    }
}


struct ImageGrind_Previews: PreviewProvider {
    static var previews: some View {
        ImagesGrind()
    }
}
