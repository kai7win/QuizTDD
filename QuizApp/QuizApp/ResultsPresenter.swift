//
//  ResultsPresenter.swift
//  QuizApp
//
//  Created by Thomas on 2023/9/24.
//

import Foundation
import QuizEngine

struct ResultsPresenter{
    
    let result:Result<Question<String>,[String]>
    let questions:[Question<String>]
    let correctAnswers:Dictionary<Question<String>,[String]>
    
    var summary:String{
        return "You got \(result.score)/\(result.answers.count) correct"
    }
    
    var presentableAnswers:[PresentableAnswer]{
        
        return questions.map { question in
            guard let userAnswer = result.answers[question],
                let correctAnswer =  correctAnswers[question] else{
                fatalError("Couldn't find correct answer for question: \(question)")
            }
            return presentableAnswer(question, userAnswer, correctAnswer)
        }
    }
    
    private func presentableAnswer(_ question:Question<String>,_ userAnswer:[String],_ correctAnswer:[String]) ->  PresentableAnswer{
        
        switch question{
        case .singleAnswer(let value),.multipleAnswer(let value):
            return PresentableAnswer(
                question: value,
                answer: forrmattedAnswer(correctAnswer),
                wrongAnswer: forrmattedWrongAnswer(userAnswer, correctAnswer))
        }
    }
    
    
    private func forrmattedAnswer(_ answer:[String]) -> String{
        return answer.joined(separator: ", ")
    }
    
    private func forrmattedWrongAnswer(_ userAnswer:[String],_ correctAnswer:[String]) -> String?{
        return correctAnswer == userAnswer ? nil : forrmattedAnswer(userAnswer)
    }
    
}
