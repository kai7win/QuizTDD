//
//  ResultHelper.swift
//  QuizAppTests
//
//  Created by Thomas on 2023/9/24.
//

@testable import QuizEngine

extension Result:Hashable{
    
    static func make(answers:[Question:Answer],score:Int) -> Result<Question,Answer>{
        return Result(answers: answers, score: score)
    }

    public var hashValue:Int{
        return 1
    }
    
    public static func ==(lhs:Result<Question,Answer>,rhs:Result<Question,Answer>) -> Bool{
        return lhs.score == rhs.score
    }
}
