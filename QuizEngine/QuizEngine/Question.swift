//
//  Question.swift
//  QuizApp
//
//  Created by Thomas on 2023/9/9.
//

import Foundation

public enum Question<T:Hashable>:Hashable{
    case singleAnswer(T)
    case multipleAnswer(T)
    
    public var hashValue: Int{
        switch self{
        case .singleAnswer(let value):
            return "singleAnswer".hashValue ^ value.hashValue
        case .multipleAnswer(let value):
            return "multipleAnswer".hashValue ^ value.hashValue
        }
    }
    

}
