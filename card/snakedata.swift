//
//  data.swift
//  card
//
//  Created by Eatmyself on 2020/11/24.
//

import SwiftUI

class snakeData: ObservableObject {
    @AppStorage("snakes") var snakedata: Data?
    
    @Published var snakes = [snake](){
            didSet {
                let encoder = JSONEncoder()
                do {
                    let data = try encoder.encode(snakes)
                    snakedata = data
                } catch {
                }
            }
        
        }
    init() {
        if let snakedata = snakedata {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([snake].self,
            from: snakedata) {
                snakes = decodedData
            }
        }
    }
}

