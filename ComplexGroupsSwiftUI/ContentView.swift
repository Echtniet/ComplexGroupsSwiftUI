//
//  ContentView.swift
//  ComplexGroupsSwiftUI
//
//  Created by Davelaar,Clinton B on 2/1/21.
//  Copyright © 2021 Davelaar,Clinton B. All rights reserved.
//

import SwiftUI

struct Trend: Identifiable, Hashable {
    let id: Int
    let text, imageName: String
}

struct Post: Identifiable, Hashable {
    let id: Int
    let user, text, imageName: String
}

struct ContentView: View {
    
    let posts: [Post] = [
        .init(id: 0, user: "Clinton Davelaar", text: "I love supra", imageName: "supra"),
        .init(id: 1, user: "Michael burnes", text: "I love Jags", imageName: "jag"),
        .init(id: 2, user: "Chandler", text: "I love honda", imageName: "nsx"),
        .init(id: 3, user: "Clinton Davelaar", text: "I love supra", imageName: "supra"),
        .init(id: 4, user: "Clinton Davelaar", text: "I love supra", imageName: "supra")
    ]
    
    let trends: [Trend] = [
        .init(id: 0, text: "Doggos", imageName: "dog"),
        .init(id: 1, text: "Jdm power!!!", imageName: "supra"),
        .init(id: 2, text: "Burgers", imageName: "ppork"),
        .init(id: 3, text: "More Doggos", imageName: "dog"),
        .init(id: 4, text: "Jags", imageName: "jag")
    ]
    
    var body: some View {
        NavigationView{
            List {
                VStack (alignment: .leading){
                    
                    Text("Treding").padding(.leading, -2).padding(.bottom, -20)
                    ScrollView (.horizontal){
                        VStack (alignment: .leading){
                            
                            HStack {
                                ForEach(trends, id: \.self){ trend in
                                    
                                    NavigationLink(destination: TrendingDetailView(trend: trend)){
                                        TrendingView(trend: trend)
                                    }
                                    /*
                                     option 2
                                     ZStack{
                                        TrendingView(trend: trend)
                                        NavigationLink(destination: TrendingDetailView()){
                                            Rectangle()
                                                .hidden()
                                        }
                                    }
                                     */
                                    //TrendingView(trend: trend)
                                        
                                }
                                
                            }
                        }
                        
                    }.frame(height:180)
                }
                // post row
                ForEach(posts, id: \.self){ post in
                    PostView(post: post)
                }
            }.navigationBarTitle(Text("Groups"))
        }
    }
}

struct TrendingDetailView: View {
    let trend: Trend
    
    var body: some View{
        Image(trend.imageName)
        .resizable()
        .scaledToFit()
    }
}

struct TrendingView: View{
    let trend:Trend
    
    var body: some View{
        VStack {
            Image(trend.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 110, height: 110, alignment: .center)
                .cornerRadius(12)
            Text(trend.text).foregroundColor(.primary).lineLimit(nil)
        }.frame(width: 120)
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
                        
        }.padding(.leading, -20).padding(.bottom, -8).padding(.trailing, -21)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
