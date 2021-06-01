//
//  ContentView.swift
//  CloneInsta
//
//  Created by Florian  on 26/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Section{
        TabView{
            NavigationView {
                InstaHeader()
            }.tabItem { Image(systemName: "house")
                .foregroundColor(.black)
                
            }
            ImagesGrind().tabItem { Image(systemName: "book.fill")
                .foregroundColor(.black)
                
            }
            }
            
        }
        
    }
}


struct HomeView: View{
    var body: some View {
        ScrollView(showsIndicators: false){
            LazyVStack(alignment: .leading, spacing: 0){
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack(spacing: 10){
                        ForEach(People.all) {
                            people in
                            ScrollViewPeople(people: people)
                        }
                        
                    }
                }
                Divider()
                ForEach(Post.all) { post in
                    ScrollViewPost(post : post)
                }
            }
            
       
        }.frame(alignment: .top)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InstaHeader: View {
    
    
    var body: some View {
        HomeView()
            .navigationBarItems(
                leading: Button(action: {}, label: {
                    Image("instaclone")
                        .resizable()
                        .frame(width: 130, height: 40)
                    
                }),
                trailing:
                    HStack{
                        Button(action: { }, label: {
                                Image(systemName: "plus.app")}).foregroundColor(.black)
                        Spacer(minLength: 15)
                        Button(action: {}, label: {
                                Image(systemName: "heart")}).foregroundColor(.black)
                        Spacer(minLength: 15)
                        Button(action: {}, label: {
                                Image(systemName: "paperplane")}).foregroundColor(.black)
                        })
    }
}

struct ScrollViewPeople: View {
    
    var people : People
    var width : CGFloat = 70
    var showName = true
    
    
    var body: some View {
        VStack{
            Image(people.imageName)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: width, height: width + 5, alignment: .center)
                .overlay(Circle().stroke(Color.green, style : StrokeStyle(lineWidth: 2)).frame(width: width + 5, height: width + 5))
                .aspectRatio(contentMode: .fill)
            if showName {
            Text(people.name)
                .frame(width : 80)
                .lineLimit(1)
                .font(.system(size: 10))
            }
        }
    }
    
}

struct ScrollViewPost: View {
    
    @State private var isLovely : Bool = false
    
    var post : Post
            
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                ScrollViewPeople(people: post.author, width : 30, showName : false)
                VStack(alignment: .leading){
                    Text(post.author.name)
                        .font(.headline)
                    Text(post.localisation)
                        .font(.system(size: 13))
                        .frame(alignment: .center)
                }
                Spacer()
                Image(systemName: "ellipsis")
            }.padding(.all, 10)
            Image(post.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            HStack(spacing: 10){
                //heart gestion
                Button(action: {   self.isLovely.toggle()
                                    
}, label: {
    Image(systemName: self.isLovely == false ? "heart" : "heart.fill")}).foregroundColor(.black)
                    .padding(3)
                    .font(.system(size: 20))
                //
                Button(action: {}, label: {
                        Image(systemName: "message")})
                    .foregroundColor(.black)
                    .padding(3)
                    .font(.system(size: 20))
                Button(action: {}, label: {
                        Image(systemName: "paperplane")}).foregroundColor(.black)
                    .padding(3)
                    .font(.system(size: 20))
                Spacer()
                Button(action: {}, label: {
                        Image(systemName: "bookmark")}).foregroundColor(.black)
                    .padding(.trailing, 10)
                    .font(.system(size: 20))
                
            }
            Text("\(post.likes) J'aime")
                .bold()
                .padding(.leading, 15)
                .font(.system(size: 15))
            HStack{
                Text("\(post.author.name)")
                    .bold()
                Text("\(post.comment)")
                    .lineLimit(2)
            }.padding(.leading, 15)
            .font(.system(size: 15))
        }
    }
}
