//
//  Router.swift
//  QuizEngine
//
//  Created by Thomas on 2023/9/9.
//

import Foundation

@available(*,deprecated)
public protocol Router {
    associatedtype Question:Hashable
    associatedtype Answer
    
    func routeTo(question:Question,answerCallback:@escaping (Answer) -> Void)
    func routeTo(result:Result<Question,Answer>)
}
