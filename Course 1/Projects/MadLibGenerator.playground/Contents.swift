import UIKit
//Pokemon is a  fun Anime to watch. It has many different characters and types of Pokemon that you have a hard time choosing your favorite. My favorite Pokemon is Charizard.
//It was a snowy day in November. Emilio and Josue said it would be the perfect day to go snowboarding because the mountains would be packed with snow.
//During the summer, Emilio and Stephen like to go hiking. They have a lot of fun and eat good after every hike.
let randomStorySelection = Int.random(in: 1...3)
func generateMadLib (noun: String, noun2: String, adjective: String, verb: String) -> String {
    if noun.isEmpty {
        if noun2.isEmpty {
            if adjective.isEmpty {
                if verb.isEmpty {
                    
                }
            }
            
        }
        return "Invalid Input"
    }
let nouns = [noun, noun2]
    let nounsShuffled = nouns.shuffled()
    let randomNoun1 = nounsShuffled [0]
    let randomNoun2 = nounsShuffled [1]
    
    var story: String
    switch randomStorySelection{
    case 1:
        story = "\(noun) is a \(adjective) Anime to watch. It has many different characters and types of \(randomNoun1) that you have a hard time \(verb) your favorite. My favorite \(randomNoun2) is \(randomNoun2)"
    case 2:
        story = "It was a \(adjective) day in November. \(randomNoun1) and \(randomNoun2) said it would be the perfect day to go \(verb) because the mountains would be packed with snow."
    case 3:
        story = "During the summer, \(randomNoun1) and \(randomNoun2) like to go hiking. They have a lot of \(adjective) and \(verb) good food after every hike."
    default:
        story = "If you are seeing this something is wrong"
    }
    return story
}

print(generateMadLib(noun: "Pokemon", noun2: "Charizard", adjective: "fun", verb: "choosing"))





