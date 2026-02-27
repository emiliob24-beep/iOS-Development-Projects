//
//  ContentView.swift
//  SpaceShip
//
//  Created by Emilio Briceno on 2/26/26.
//

import SwiftUI

@Observable class ShipComputer {
    var availablePower = 10
    var heading = ""
}

struct SpaceshipScreen: View {
//    @State var helmStation = HelmStation()
//    @State var weaponStation = WeaponsStation()
//    @State var shieldStation = ShieldStation()
//    @State var engineStation = EngineStation()
    @State var computer = ShipComputer()
    var body: some View {
        Form {
            Section("Helm Station") {
                HelmStation()
            }
            
            Section("Weapons Station") {
                WeaponsStation()
            }
            
            Section("Shield Station") {
                ShieldStation()
            }
            
            Section("Engine Station") {
                EngineStation()
            }
            
            Text("Available Power: \(computer.availablePower)")

        }
        .environment(computer)
        .padding()
    }
}

struct HelmStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @State private var inChair: Bool = false
    
    var body: some View {
        HStack {
            CrewChair(crewMember: .dog, inChair: $inChair)
            @Bindable var computer = shipComputer
            TextField("Heading", text: $computer.heading)//("SYSTEM OFFLINE"))
                .disabled(!inChair)
        }
    }
}

struct WeaponsStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @State private var isOn: Bool = false
    @State private var weaponsPower: Int = 0
    @State private var inChair: Bool = false
    var body: some View {
        HStack {
            CrewChair(crewMember: .cat, inChair: $inChair)
            
            VStack {
                Toggle("Weapons Power: \(weaponsPower)", isOn: $isOn)
                    .onChange(of: isOn) {
                        if isOn {
                            shipComputer.availablePower -= 3
                            weaponsPower = 3
                        } else {
                            shipComputer.availablePower += 3
                            weaponsPower = 0
                        }
                        
                        if shipComputer.availablePower < 0 {
                            isOn = false
                        }
                    }
                
                    .disabled(!inChair)
                
                Button("Fire!") {
                    if weaponsPower > 0 {
                        weaponsPower -= 1
                    } else {
                        isOn = false
                    }
                    print("PEW!")
                }
                .disabled(!inChair || !isOn)
            }
        }
    }
}
struct ShieldStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @State private var shieldPower: Int = 0
    @State private var inChair: Bool = false
    var body: some View {
        HStack {
            CrewChair(crewMember: .lizard, inChair: $inChair)
            Stepper("Shield Power: \(shieldPower)", onIncrement: {
                if shipComputer.availablePower > 0 {
                    shieldPower += 1
                    shipComputer.availablePower -= 1
                }
            }, onDecrement: {
                if shieldPower > 0 {
                    shieldPower -= 1
                    shipComputer.availablePower += 1
                }
            })
            .disabled(!inChair)
        }
    }
}

struct EngineStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @State private var enginePower: Int = 0
    @State private var inChair: Bool = false
    var body: some View {
        HStack {
            CrewChair(crewMember: .hare, inChair: $inChair)
            Stepper("Engine Power: \(enginePower)", onIncrement: {
                if shipComputer.availablePower > 0 {
                    enginePower += 1
                    shipComputer.availablePower -= 1
                }
            }, onDecrement: {
                if enginePower > 0 {
                    enginePower -= 1
                    shipComputer.availablePower += 1
                }
            })
            .disabled(!inChair)

        }
    }
}

struct CrewChair: View {
    var crewMember: Crew
    @Binding var inChair: Bool
    
    var body: some View {
        HStack {
            Button {
                inChair.toggle()
            } label: {
                if inChair {
                    crewMember.icon
                } else {
                    Image(systemName: "person.slash")
                }
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding(5)
            .background {
                Circle()
                    .foregroundStyle(.gray)
            }
        }
    }
}

enum Crew: String {
    case dog
    case cat
    case lizard
    case hare
    
    var icon: Image {
        switch self {
        case .dog:
            Image(systemName: "dog")
        case .cat:
            Image(systemName: "cat")
        case .lizard:
            Image(systemName: "lizard")
        case .hare:
            Image(systemName: "hare")
        }
    }
}

#Preview {
    SpaceshipScreen()
}
