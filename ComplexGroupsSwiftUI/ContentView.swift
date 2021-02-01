//
//  ContentView.swift
//  ComplexGroupsSwiftUI
//
//  Created by Davelaar,Clinton B on 2/1/21.
//  Copyright © 2021 Davelaar,Clinton B. All rights reserved.
//

import SwiftUI

struct Post: Identifiable, Hashable {
    let id: Int
    let user, text, imageName: String
}

struct ContentView: View {
    
    let posts: [Post] = [
        .init(id: 0, user: "Clinton Davelaar", text: "I love supra", imageName: "supra"),
        .init(id: 1, user: "Michael burnes", text: "I love Jags", imageName: "supra"),
        .init(id: 2, user: "Chandler", text: "I love honda", imageName: "supra"),
        .init(id: 3, user: "Clinton Davelaar", text: "I love supra", imageName: "supra"),
        .init(id: 4, user: "Clinton Davelaar", text: "I love supra", imageName: "supra")
    ]
    
    var body: some View {
        NavigationView{
            List {
                ScrollView (.horizontal){
                    VStack (alignment: .leading){
                        Text("Treding")
                        HStack {
                            VStack {
                                Image("dog")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("Group 1")
                            }
                            
                            Text("Group 6")
                            Text("Group 2")
                            Text("Group 3")
                            Text("Group 4")
                            Text("Group 5")
                            Text("test")
                            Text("Group 3")
                            Text("Group 4")
                            Text("Group 5")
                        }
                    }
                    
                }.frame(height:180)
                // post row
                ForEach(posts, id: \.self){ post in
                    PostView(post: post)
                }
            }.navigationBarTitle(Text("Groups"))
        }
    }
}

struct PostView: View{
    let post:Post
    
    var body: some View{
        VStack(alignment: .leading, spacing: 16){
            HStack {
                Image("ppork")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width:60, height: 60)
                    .clipped()
                VStack (alignment: .leading, spacing: 4){
                    Text(post.user).font(.headline)
                    Text("posted 8 hrs ago").font(.subheadline)
                }.padding(.leading, 8)
            }.padding(.leading, 16).padding(.top, 16)
            Text(post.text).lineLimit(nil).padding(.leading, 16).padding(.trailing, 32)
            Image(post.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        }.padding(.leading, -20).padding(.bottom, -8).padding(.trailing, -20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
