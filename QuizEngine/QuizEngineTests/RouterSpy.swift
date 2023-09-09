//
//  RouterSpy.swift
//  QuizEngineTests
//
//  Created by Thomas on 2023/9/9.
//

import Foundation
import QuizEngine

class RouterSpy:Router{
    
    var routedQuestions:[String] = []
    var routedResult:Result<String,String>? = nil
    var answerCallback: (String) -> Void = { _ in }
    
    func routeTo(question: String,answerCallback:@escaping (String) -> Void) {
        routedQuestions.append(question)
        self.answerCallback = answerCallback
    }
    
    func routeTo(result: Result<String,String>) {
        routedResult = result
    }
}
