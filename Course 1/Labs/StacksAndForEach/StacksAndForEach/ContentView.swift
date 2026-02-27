//
//  ContentView.swift
//  StacksAndForEach
//
//  Created by Emilio Briceno on 2/19/26.
//

import SwiftUI

struct ContentView: View {
    @State var backgroundColor: Color = .black
    let images = ["person.fill", "pencil", "airplane.departure" ]
    var body: some View {
//        ZStack {
//            backgroundColor
//                .ignoresSafeArea()
        VStack (spacing: 10) {
            HStack{
                Text("emiliobriceno3")
                    .foregroundStyle(.white)
                    .bold()
                Image(systemName: "chevron.down")
                    .foregroundStyle(.white)
            }
            VStack(alignment: .center) {
                Text("Emilio Briceno")
                    .foregroundStyle(.white)
                    .frame(width: 120, alignment: .leading)
                    .padding(.horizontal)
                
            }
            HStack(spacing: 60) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                    .foregroundStyle(.white)
                    .font(.system(size: 100))
                    .padding(10)
                HStack() {
                    VStack {
                        Text("7")
                            .bold()
                        Text("Post")
                    } .foregroundStyle(.white)
                    VStack {
                        Text("475")
                            .bold()
                        Text("Followers")
                    } .foregroundStyle(.white)
                    VStack{
                        Text("154")
                            .bold()
                        Text("Friends")
                    } .foregroundStyle(.white)
                }
                .font(.title3)
            }
            HStack {
                VStack (alignment: .leading) {
                    Text("Personal Blog")
                    Text("AZ🌵 ➡️ UT🏔️")
                    Text("MMII")
                }
                .font(.title3)
                .foregroundStyle(.white)
                .frame(alignment: .leading)
                .padding(.horizontal)
                Spacer()
            }
            Spacer()
            //                Spacer()
            HStack(spacing: 80) {
                Image(systemName: "rectangle.grid.3x3.fill")
                Image(systemName: "play.rectangle")
                Image(systemName: "arrow.trianglehead.2.counterclockwise")
                Image(systemName: "person.bubble")
            }
            .foregroundStyle(.white)
            .font(.title)
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            ScrollView {
            HStack {
                ForEach(images, id: \.self) {
                    images in
                    VStack(spacing: 5) {
                        HStack {
                            Image(systemName: images)
                                .resizable()
                                .frame(width: 125, height: 90)
                                .foregroundStyle(.white)
                                .font(.headline)
                                .border(.white)
                        }
                        HStack {
                            Image(systemName: images)
                                .resizable()
                                .frame(width: 125, height: 90)
                                .foregroundStyle(.white)
                                .font(.headline)
                                .border(.white)
                        }
                        HStack {
                            Image(systemName: images)
                                .resizable()
                                .frame(width: 125, height: 90)
                                .foregroundStyle(.white)
                                .font(.headline)
                                .border(.white)
                        }
                        HStack {
                            Image(systemName: images)
                                .resizable()
                                .frame(width: 125, height: 90)
                                .foregroundStyle(.white)
                                .font(.headline)
                                .border(.white)
                        }
                        HStack {
                            Image(systemName: images)
                                .resizable()
                                .frame(width: 125, height: 90)
                                .foregroundStyle(.white)
                                .font(.headline)
                                .border(.white)
                        }
                        HStack {
                            Image(systemName: images)
                                .resizable()
                                .frame(width: 125, height: 90)
                                .foregroundStyle(.white)
                                .font(.headline)
                                .border(.white)
                        }
                    }
                }
            }
        }
    }
            .background { backgroundColor.ignoresSafeArea() }
//        }
//        ZStack {
//            HStack(spacing: 80){
//                Image(systemName: "rectangle.grid.3x3.fill")
//                Image(systemName: "play.rectangle")
//                Image(systemName: "arrow.trianglehead.2.counterclockwise")
//                Image(systemName: "person.bubble")
//            }
//            .foregroundStyle(.white)
//            .position(x: 200)
//            .background(Color.black)
//            .font(.title)
//
//            HStack {
//                    ForEach(images, id: \.self) {
//                        images in
//                        VStack(spacing: 5) {
//                        HStack {
//                            Image(systemName: images)
//                                .resizable()
//                                .frame(width: 125, height: 90)
//                                .foregroundStyle(.white)
//                                .font(.headline)
//                                .border(.white)
//                        }
//                        HStack {
//                            Image(systemName: images)
//                                .resizable()
//                                .frame(width: 125, height: 90)
//                                .foregroundStyle(.white)
//                                .font(.headline)
//                                .border(.white)
//                        }
//                        HStack {
//                            Image(systemName: images)
//                                .resizable()
//                                .frame(width: 125, height: 90)
//                                .foregroundStyle(.white)
//                                .font(.headline)
//                                .border(.white)
//                            }
//                    }
//                }
//            }
//        }
    }
}

#Preview {
    ContentView()
}
//Image(systemName: "globe.americas.fill")
//Image(systemName: "sunrise.fill")
//Image(systemName: "airplane.departure")
