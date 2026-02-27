//
//  ContentView.swift
//  ViewModifier
//
//  Created by Emilio Briceno on 2/26/26.
//

import SwiftUI

struct MyView: View {
    @State var backgroundColor = Color.white
    //Add something that will ignore safe area.
  var body: some View {
      Button(action: {
          print("Image button tapped!")
      }) {
          Text("Do Something")
      }
      .hidden()

      VStack {
          Button(action: {
          print("Cursed Technique Lapse: Blue")
              backgroundColor = .blue
          }) {
              Text("Lapse: Blue")
                  .blueStyle()
          }
          Button(action: {
              print("Hollow Purple")
                  backgroundColor = .purple
          }) {
              Text("Hollow Purple")
                  .purpleStyle()
          }
          Button(action : {
              print("Cursed Technique Reversal: Red")
              backgroundColor = .red
          }) {
              Text("Reversal: Red")
                  .redStyle()
          }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background {
          (backgroundColor.ignoresSafeArea())
      }
  }
}

extension View {
    func redStyle() -> some View {
        self
        .frame(width: 210, height: 200)
        .font(.custom("Marker Felt", size: 26))
        .border(.red)
        .background(.red)
        .clipShape(Circle())
        .foregroundStyle(.red)
        .position(x: 200, y: 130)
        .strikethrough()
    }
    func purpleStyle() -> some View {
        self
            .frame(width: 250, height: 200)
            .font(.custom("Times New Roman", size: 27))
            .border(.purple)
            .background(.purple)
            .clipShape(Circle())
            .foregroundStyle(.purple)
            .strikethrough()
    }
    func blueStyle() -> some View {
        self
            .frame(width: 210, height: 200)
            .font(.custom("Marker Felt", size: 27))
            .border(.blue)
            .background(.blue)
            .clipShape(Circle())
            .foregroundStyle(.blue)
            .position(x: 200, y: 130)
            .strikethrough()
    }
}

#Preview {
    MyView()
}
