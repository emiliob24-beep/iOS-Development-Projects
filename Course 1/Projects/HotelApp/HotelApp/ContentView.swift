//
//  ContentView.swift
//  HotelApp
//
//  Created by Emilio Briceno on 2/26/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            HotelRegistrationScreen()
        }
    }
}
enum Guests : Int, CaseIterable {
    case one, two, three, four, five, six, seven, eight, nine, ten
}
struct HotelRegistrationScreen: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var doorCode = ""
    @State private var numberOfGuests: Guests = .one
    @State private var lengthOfStay: Int = 0
    @State private var nonSmoking: Bool = false
    @State private var registrationFeedback: Int = 0
    @State private var isSubmitted = false
    private var isFormValid: Bool {
        !firstName.trimmingCharacters(in: .whitespacesAndNewlines) .isEmpty &&
        !lastName.trimmingCharacters(in: .whitespacesAndNewlines) .isEmpty &&
        !doorCode.trimmingCharacters(in: .whitespacesAndNewlines) .isEmpty &&
        doorCode.count >= 4 &&
        lengthOfStay > 0
    }
    var body: some View {
        VStack(spacing: 5) {
            HStack(alignment: .center) {
                Image("mountainlandLogo")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding(8)
                Text("Mountainland Inn")
                    .foregroundStyle(Color.background)
                    .font(.custom("Arial", size: 25))
                    .frame(height: 75)
                    .padding(15)
                    .background(.highlight)
                    .cornerRadius(10)
            }
            .padding(10)
            
            VStack(alignment: .leading) {
                TextField("First Name", text: $firstName)
                    .padding(12)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            TextField("Last Name", text: $lastName)
                .padding(12)
                .background(.regularMaterial)
                .cornerRadius(10)
                .padding(.horizontal)
            SecureField("Door Code", text: $doorCode)
                .padding(12)
                .background(.regularMaterial)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            
            HStack {
                Text("Guests")
                    .padding(20)
                Picker("Number of Guests", selection: $numberOfGuests) {
                    ForEach(Guests.allCases, id: \.self) { guests in
                        Text(String(guests.rawValue))
                    }
                }
                .padding(5)
                Spacer()
            }
            Stepper("Length Of Stay: \(lengthOfStay)", value: $lengthOfStay , in: 0...30, step: 1)
                .padding(20)
            Toggle("Non Smoking", isOn: $nonSmoking)
                .padding(20)
            
            Button {
                withAnimation {
                    isSubmitted = true
                }
            } label: {
                Text(isSubmitted ? "Submitted!" : "Submit")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.black)
                    .buttonStyle(BorderedButtonStyle())
                    .background(
                        Capsule()
                            .foregroundStyle(Color.blue)
                            .padding(.horizontal)
                    )
            }
            .disabled(!isFormValid || isSubmitted)
            
            if isSubmitted {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Thank you for booking with us! How would you rate your experience?")
                        .font(.headline)
                        .padding(.horizontal)

                    Slider(
                        value: Binding(
                            get: { Double(registrationFeedback) },
                            set: { registrationFeedback = Int($0.rounded()) }
                        ),
                        in: 1...5,
                        step: 1
                    )
                    .padding(.horizontal)

                    Text("\(registrationFeedback)/5 ⭐️s")
                        .font(.subheadline)
                        .padding(.horizontal)
                }
                .padding(.vertical, 8)
                .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
        }
    }
}
#Preview {
    ContentView()
}
