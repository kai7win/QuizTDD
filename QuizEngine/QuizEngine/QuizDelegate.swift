//
//  QuizDelegate.swift
//  QuizEngine
//
//  Created by Thomas on 2023/10/2.
//

import Foundation

public protocol QuizDelegate{
    associatedtype Question:Hashable
    associatedtype Answer
    
    func handle(question:Question,answerCallback:@escaping (Answer) -> Void)
    func handle(result:Result<Question,Answer>)
}
