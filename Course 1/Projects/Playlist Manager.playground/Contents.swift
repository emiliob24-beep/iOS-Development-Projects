import UIKit

struct Song: CustomStringConvertible {
    let title: String
    let artist: String
    let duration: Double
    var description: String { "\(title) by \(artist) is \(duration) minutes long"}
}

class Playlist {
    let name: String
    let author: String
    var songs: [Song]
    var currentlyPlaying: Song?
    var count: Int {songs.count}

    
    init(name: String, author: String, songs: [Song], currentlyPlaying: Song? = nil) {
        self.name = name
        self.author = author
        self.songs = songs
        self.currentlyPlaying = currentlyPlaying
    }
    func add(_ song: Song) {
        songs.append(song)
    }
    func remove(at index: Int) {
        songs.remove(at: index)
    }
    func allSongs() -> [Song] {
        return songs
    }
    
}

let song1 = Song(title: "Song1", artist: "Author1", duration: 3)
let song2 = Song(title: "Song2", artist: "Author2", duration: 3)
let song3 = Song(title: "Song3", artist: "Author3", duration: 3)
let song4 = Song(title: "Song4", artist: "Author4", duration: 3)
let song5 = Song(title: "Song5", artist: "Author5", duration: 3)
var myPlaylist = Playlist(name: "Song1", author: "Author1", songs: [song1])

myPlaylist.add(song2)
myPlaylist.add(song3)
myPlaylist.add(song4)
myPlaylist.add(song5)
print(myPlaylist.songs)
myPlaylist.remove(at: 3)
print(myPlaylist.songs)

let songsInPlaylist = myPlaylist.allSongs()
let count = myPlaylist.allSongs().count
print(myPlaylist.count)
print("This playlist has \(myPlaylist.count) songs")


