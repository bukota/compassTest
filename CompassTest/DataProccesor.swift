//
//  DataProccesor.swift
//  CompassTest
//
//  Created by Nicolas Bukstein on 16/5/24.
//

import Foundation

struct DataProccesor {

    func every10thCharacterRequest(from data: String) -> String {
        var ret = ""
        var index = 1
        for char in data {
            if index%10 == 0 {
                ret += "\(char) "
            }
            index+=1
        }
        ret.removeLast()
        return ret
    }

    func wordCounterRequest(from data: String) -> String {
        return data.components(separatedBy: " ").map { "\"\($0)\"" }.joined(separator: ", ")
    }
}
