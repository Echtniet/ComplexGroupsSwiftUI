//
//  ContentView.swift
//  ComplexGroupsSwiftUI
//
//  Created by Davelaar,Clinton B on 2/1/21.
//  Copyright © 2021 Davelaar,Clinton B. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let posts = ["1", "2", "3"]
    
    var body: some View {
        NavigationView{
            List {
                ScrollView (.horizontal){
                    VStack (alignment: .leading){
                        Text("Treding")
                        HStack {
                            Text("Group 1")
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
                    
                }.frame(height:100)
                // post row
                ForEach(posts, id: \.self){ post in
                    PostView()
                }
            }.navigationBarTitle(Text("Groups"))
        }
    }
}

struct PostView: View{
    var body: some View{
        VStack(alignment: .leading, spacing: 16){
            HStack {
                Image("ppork")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width:60, height: 60)
                    .clipped()
                VStack (alignment: .leading, spacing: 4){
                    Text("Bill Clinton").font(.headline)
                    Text("posted 8 hrs ago").font(.subheadline)
                }.padding(.leading, 8)
            }.padding(.leading, 16).padding(.top, 16)
            Text("Post body text that will hopefully support auto sizing vertically and span multple lines").lineLimit(nil).padding(.leading, 16).padding(.trailing, 32)
            Image("supra")
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
