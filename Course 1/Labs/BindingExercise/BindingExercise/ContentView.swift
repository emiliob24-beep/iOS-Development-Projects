//
//  ContentView.swift
//  BindingExercise
//
//  Created by Emilio Briceno on 2/26/26.
//

import SwiftUI
//@State Practice

//struct StatePracticeView: View {
//   @State private var count = 0
//
//    var body: some View {
//        VStack(spacing: 12) {
//            Text("Count: \(count)")
//
//            Button("Increase") {
//                count += 1
//                // Increase count by 1
//            }
//
//            Button("Reset") {
//                count = 0
//                // Set count to 0
//            }
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    StatePracticeView()
//}

//@Binding Practice

//struct BindingParentView: View {
//    @State private var isPlaying = false
//
//    var body: some View {
//        VStack(spacing: 16) {
//            Text(isPlaying ? "Now Playing" : "Paused")
//
//            PlayPauseButton(isPlaying: $isPlaying)
//        }
//        .padding()
//    }
//}
//
//struct PlayPauseButton: View {
//    @Binding var isPlaying: Bool
//
//    var body: some View {
//        Button(isPlaying ? "Pause" : "Play") {
//            isPlaying.toggle()
//        }
//        .font(.title2)
//        .buttonStyle(.glassProminent)
//    }
//}
//
//#Preview {
//    BindingParentView()
//}

//@Observable Practice

//

//@Environment Practice

@Observable
final class Account {
    var username: String? = nil

    func login() { username = "Kevin" }
    func logout() { username = nil }
}

struct RootView: View {
    let account = Account()

    var body: some View {
        NavigationStack {
            LevelOneView()
                .environment(account)
            Text(account.username ?? "Not logged in")
        }
    }
}

struct LevelOneView: View {
    @Environment(Account.self) private var account
    var body: some View {
        VStack(spacing: 16) {
            Text("Level 1")
            NavigationLink("Go deeper") {
                LevelTwoView()
                    .environment(account)
            }
        }
        .padding()
    }
}

struct LevelTwoView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Level 2")
            LevelThreeView()
        }
        .padding()
        .background { Color.green }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct LevelThreeView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Level 3")
            AccountPanel()
        }
        .padding()
        .background { Color.blue }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct AccountPanel: View {
    @Environment(Account.self) private var account

    var body: some View {
        VStack(spacing: 12) {
            Text(account.username ?? "Not logged in")

            Button("Login") {
                account.login()
            }

            Button("Logout") {
                account.logout()
            }
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    RootView()
}
