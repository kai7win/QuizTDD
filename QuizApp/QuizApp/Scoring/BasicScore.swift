//
//  BasicScore.swift
//  QuizApp
//
//  Created by Thomas on 2023/10/5.
//

import Foundation

final class BasicScore{
    
    static func score(for answers:[String],comparingTo correctAnswers:[String] ) -> Int{
        
        return zip(answers,correctAnswers).reduce(0){ score,tuple in
            return score + (tuple.0 == tuple.1 ? 1 : 0)
        }
        
    }
    
}
