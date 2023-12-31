//
//  BasicScore.swift
//  QuizApp
//
//  Created by Thomas on 2023/10/5.
//

import Foundation

public final class BasicScore{
    
    public static func score<T:Equatable>(for answers:[T],comparingTo correctAnswers:[T] ) -> Int{
        
        return zip(answers,correctAnswers).reduce(0){ score,tuple in
            return score + (tuple.0 == tuple.1 ? 1 : 0)
        }
        
    }
    
}
