//
//  QuizTest.swift
//  QuizEngineTests
//
//  Created by Thomas on 2023/10/2.
//

import Foundation
import XCTest
import QuizEngine


class QuizTest: XCTestCase {
    
    private let delegate = DelegateSpy()
    private var quiz:Quiz!
    
    override func setUp(){
        super.setUp()
        quiz = Quiz.start(questions: ["Q1", "Q2"], delegate: delegate, correctAnswers: ["Q1": "A1", "Q2": "A2"])
    }
    
    func test_startQuiz_answerOneOutOfTwoCorrectly_scoresZero() {
        
        delegate.answerCallback("wrong")
        delegate.answerCallback("wrong")
        
        XCTAssertEqual(delegate.handleResult!.score, 0)
    }
    
    func test_startQuiz_answerOneOutOfTwoCorrectly_scoresOne() {
        
        delegate.answerCallback("A1")
        delegate.answerCallback("wrong")
        
        XCTAssertEqual(delegate.handleResult!.score, 1)
    }
    
    func test_startQuiz_answerTwoOutOfTwoCorrectly_scoresTwo() {
        
        delegate.answerCallback("A1")
        delegate.answerCallback("A2")
        
        XCTAssertEqual(delegate.handleResult!.score, 2)
    }
    
    private class DelegateSpy: Router,QuizDelegate {
        
        var handleResult: Result<String, String>? = nil
        
        var answerCallback: (String) -> Void = { _ in }
        
        func handle(question: String, answerCallback: @escaping (String) -> Void) {
            self.answerCallback = answerCallback
        }
        
        func routeTo(question: String, answerCallback: @escaping (String) -> Void) {
            handle(question: question, answerCallback: answerCallback)
        }
        
        func routeTo(result: Result<String, String>) {
            handle(result: result)
        }
        
        func handle(result: Result<String, String>) {
            handleResult = result
        }
        
        
    }
    
}

