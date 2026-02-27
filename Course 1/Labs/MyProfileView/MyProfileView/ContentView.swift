//
//  ContentView.swift
//  MyProfileView
//
//  Created by Emilio Briceno on 2/26/26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
//        VStack {
//            Text("Username")
//                .font(.custom("Times New Roman", size: 25))
//                .foregroundStyle(.yellow)
//            Text("Real Name")
//                .font(.custom("Times New Roman", size: 25))
//                .foregroundStyle(.blue)
//            Text("Home City")
//                .font(.custom("Times New Roman", size: 25))
//                .foregroundStyle(.red)
//            Text("Bio")
//                .font(.custom("Times New Roman", size: 25))
//        }
        VStack(spacing: 12) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.blue)
                .padding(.top)

            Text("Username: Beetlejuice")
                .font(.custom("Times New Roman", size: 20))
            Text("Real Name: Emilio Briceno")
                .font(.custom("Times New Roman", size: 20))
            Text("Home City: Riverton, UT")
                .font(.custom("Times New Roman", size: 20))
            Text("Bio: Throughout heaven and earth, I alone am the honored one.")
                .font(.custom("Times New Roman", size: 20 ))
        }
        .padding()
    }
}
#Preview("ProfileView") {
    ProfileView()
        .background(.white)
}

struct TopFiveFriendsView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "person.fill")
                    .font(.title2)
                    .foregroundStyle(.red)
                Text("Friend 1")
                    .font(.custom("Monaco", size: 22))
                    .foregroundStyle(.black)
            }
            .padding(8)
            .background(.red.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            HStack {
                Image(systemName: "person.fill")
                    .font(.title2)
                    .foregroundStyle(.blue)
                Text("Friend 2")
                    .font(.custom("Monaco", size: 22))
                    .foregroundStyle(.black)
            }
            .padding(8)
            .background(.red.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            HStack {
                Image(systemName: "person.fill")
                    .font(.title2)
                    .foregroundStyle(.purple)
                Text("Friend 3")
                    .font(.custom("Monaco", size: 22))
                    .foregroundStyle(.black)
            }
            .padding(8)
            .background(.red.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            HStack {
                Image(systemName: "person.fill")
                    .font(.title2)
                    .foregroundStyle(.green)
                Text("Friend 4")
                    .font(.custom("Monaco", size: 22))
                    .foregroundStyle(.black)
            }
            .padding(8)
            .background(.red.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
        }
    }
}
#Preview("TopFiveFriendsView") {
    TopFiveFriendsView()
        .background(.white)
}

struct BlogPostView: View {
    var body: some View {
//        VStack {
//            Text("Title: ")
//                .font(.custom("Trattatello", size: 35))
//            Text("Date: 02/17/2026")
//                .font(.custom("", size: 20))
//            Text("Body")
//                .font(.custom("", size: 25))
//            Text("Likes: ")
//                .font(.custom("", size: 20))
//            Text("Comments: ")
//                .font(.custom("", size: 20))
//        }
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: "person.fill")
                .scaledToFill()
                .frame(width: 20, height: 50)
                .background(.blue.opacity(0.2))
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 12))

            Text("Title: A Day in the life")
                .font(.custom("Trattatello", size: 35))

            Text("Date: 02/17/2026")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("For todays activity we will be going to Zumba class!")
                .font(.body)

            HStack(spacing: 16) {
                Label("Likes: 12", systemImage: "hand.thumbsup.fill")
                Label("Comments: 3", systemImage: "text.bubble.fill")
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }
        .padding()
    }
}
#Preview("BlogPostView") {
    BlogPostView()
        .background(.white)
}
