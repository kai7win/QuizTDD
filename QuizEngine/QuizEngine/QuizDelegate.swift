//
//  QuizDelegate.swift
//  QuizEngine
//
//  Created by Thomas on 2023/10/2.
//

import Foundation

public protocol QuizDelegate{
    associatedtype Question
    associatedtype Answer
    
    func answer(for question:Question,completion:@escaping (Answer) -> Void)
    
    func didCompleteQuiz(withAnswers:[(question:Question,answer:Answer)])
    
}

