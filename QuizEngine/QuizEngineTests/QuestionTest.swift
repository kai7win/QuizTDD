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
    
    func test_hashValue_withSameWrappedValue_isDifferentForSingleAndMultiplerAnswer(){

        let aValue = UUID()

        XCTAssertNotEqual(Question.singleAnswer(aValue).hashValue,Question.multipleAnswer(aValue).hashValue)
    }

    
    func test_hashValue_forSingleAnswer(){
        
        let aValue = UUID()
        let anotherValue = UUID()
        
        XCTAssertEqual(Question.singleAnswer(aValue).hashValue,
                       Question.singleAnswer(aValue).hashValue)
        
        XCTAssertNotEqual(Question.singleAnswer(aValue).hashValue,
                       Question.singleAnswer(anotherValue).hashValue)
    }
    
    func test_hashValue_forMutipleAnswer(){
        
        let aValue = UUID()
        let anotherValue = UUID()
        
        XCTAssertEqual(Question.multipleAnswer(aValue).hashValue,
                       Question.multipleAnswer(aValue).hashValue)
        
        XCTAssertNotEqual(Question.multipleAnswer(aValue).hashValue,
                       Question.multipleAnswer(anotherValue).hashValue)
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
