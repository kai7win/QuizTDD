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
            return value.hashValue
        case .multipleAnswer(let value):
            return value.hashValue
        }
    }
    
    public static func ==(lhs:Question<T>,rhs:Question) -> Bool{
        switch (lhs,rhs){
        case (.singleAnswer(let a),.singleAnswer(let b)):
            return a == b
        case (.multipleAnswer(let a),.multipleAnswer(let b)):
            return a == b
        default:
            return false
        }
    }
}