//
//  QuestionTest.swift
//  QuizAppTests
//
//  Created by Thomas on 2023/9/9.
//

import Foundation
import XCTest
@testable import QuizEngine

class QuestionTest:XCTestCase{
    
    func test_hashValue_singleAnswer_returnsTypeHash(){
        
        let type = "a string"
        let sut = Question.singleAnswer(type)
        
        XCTAssertEqual(sut.hashValue,type.hashValue)
    }
    
    func test_hashValue_mutipleAnswer_returnsTypeHash(){
        
        let type = "a string"
        let sut = Question.singleAnswer(type)
        
        XCTAssertEqual(sut.hashValue,type.hashValue)
    }
    
    func test_equal_isEqual(){
        XCTAssertEqual(Question.singleAnswer("a string"),Question.singleAnswer("a string"))
        XCTAssertEqual(Question.multipleAnswer("a string"),Question.multipleAnswer("a string"))
    }
    
    func test_notEqual_isNotEqual(){
        XCTAssertNotEqual(Question.singleAnswer("a string"),Question.singleAnswer("another string"))
        XCTAssertNotEqual(Question.multipleAnswer("a string"),Question.multipleAnswer("another string"))
        XCTAssertNotEqual(Question.singleAnswer("a string"),Question.multipleAnswer("another string"))
        XCTAssertNotEqual(Question.singleAnswer("a string"),Question.multipleAnswer("a string"))
    }
    

    
}
