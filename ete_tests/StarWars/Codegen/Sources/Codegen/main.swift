import Foundation
import Files
import SwiftGraphQLCodegen


// let endpoint = URL(string: "http://api.spacex.land/graphql")!
let endpoint = URL(string: "http://localhost:4000")!
// let endpoint = URL(string: "https://api.react-finland.fi/graphql")!

do {
    let target = try Folder.current.parent!
        .subfolder(at: "StarWars")
        .createFile(at: "API.swift").url
    let generator = GraphQLCodegen()
    
    try generator.generate(target, from: endpoint)
    
    print("Generated API to \(target.absoluteString)")
} catch let error {
    print("ERROR: \(error.localizedDescription)")
    exit(1)
}

