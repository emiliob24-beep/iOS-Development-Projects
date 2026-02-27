//
//  ContentView.swift
//  ButtonApp
//
//  Created by Emilio Briceno on 2/26/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isScaled = false
    @State private var backgroundColor = Color.white
    @State private var isHighlighted = false
    @State private var isDisabled = false
    var body: some View {
        
        Button("Hello") {
            print("Hello Button 1")
            someOtherFunction()
        }
        
        Button {
            print("Howdy Button 2")
            someOtherFunction()
        } label: {
            Image(systemName: "playstation.logo")
                .resizable()
                .frame(width: 50, height: 50)
                .border(.black)
                .buttonStyle(.borderedProminent)
                .disabled(true)
        }
        
        Button {
            print("Next Button 3")
            someOtherFunction()
        }  label: {
            Text("Next")
                .frame(maxWidth: .infinity)
                .buttonStyle(BorderedButtonStyle())
                .foregroundStyle(Color.black)
                .background(
                    Capsule()
                        .foregroundStyle(Color.gray))
                .padding(.vertical, 8)
                .padding()
        }
        Button {
            print("I am button 4")
            someOtherFunction()
        } label: {
            Text("Button 4")
        }
        .frame(maxWidth: .infinity)
        .tint(Color.black)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color.blue)
        )
        .padding(.horizontal)
        
        Button(action: someOtherFunction) {
            Text("Button 5")
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(.yellow)
                )
                .padding(.horizontal)
                .padding()
        }
        
        Button(action: someOtherFunction) {
            Text("Button 6")
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .border(.red)
                .padding(.horizontal)
                .disabled(true)
        }
        
        HStack(spacing: 24) {
            Button("Button 7") {
                withAnimation(.spring) {
                    isHighlighted.toggle()
                }
            }
            RoundedRectangle(cornerRadius: 12)
                .fill(isHighlighted ? Color.orange : Color.gray.opacity(0.3))
                .frame(height: 100)
                .overlay(
                    Text(isHighlighted ? "Highlighted!" : "Normal")
                        .foregroundStyle(.black)
                )
                .scaleEffect(isHighlighted ? 1.1 : 1.0)
                .animation(.spring(), value: isHighlighted)
        }
        .padding()
        
        VStack(spacing: 5) {
            Button("Toggle Disabled") {
                isDisabled.toggle()
            }
            Button("Action") {
                print("Tapped")
            }
            .disabled(isDisabled)
        }
        .padding()
        
        Button(action : {
            print("Cursed Technique Reversal: Red")
            backgroundColor = .red
        }) {
            Text("Reversal: Red")
                .redStyle()
        }
        Button(action: toggle) {
            Text("Technique")
        
        }
        .buttonStyle(GradientButton())
        .position(x:220, y: -150)
    }
}
struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundStyle(.black)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple, .red]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .clipShape(Capsule())
                .padding(.horizontal)
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(.easeOut, value:configuration.isPressed)
    }
}

func someOtherFunction() {
}
func toggle() {
}
extension View {
    func redStyle() -> some View {
        self
            .frame(width: 210, height: 200)
            .font(.custom("Marker Felt", size: 26))
            .background(.red)
            .border(.red)
            .clipShape(Circle())
            .foregroundStyle(.red)
            .position(x: 200, y: 130)
    }
}

#Preview {
    ContentView()
}
