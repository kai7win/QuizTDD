//
//  Game.swift
//  QuizEngineTests
//
//  Created by Thomas on 2023/9/9.
//

import Foundation

public func startGame<Question:Hashable,Answer,R:Router>(questions:[Question],router:R,correctAnswers:[Question:Answer]) where R.Question == Question,R.Answer == Answer {
    
}

