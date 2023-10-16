//
//  ScoreTest.swift
//  QuizEngineTests
//
//  Created by Thomas on 2023/10/5.
//

import Foundation
import XCTest
@testable import BasicQuizDomain

class ScoreTest:XCTestCase{
    
    func test_noAnswers_scoresZero(){
        
        XCTAssertEqual(BasicScore.score(for:[String](),comparingTo: [String]()), 0)
        
    }
    
    func test_oneNonMatchingAnswer_scoresZero(){
        
        XCTAssertEqual(BasicScore.score(for:["not a match"],comparingTo:["an answer"]), 0)
        
    }
    
    func test_oneMatchingAnswer_scoresOne(){
        
        XCTAssertEqual(BasicScore.score(for:["an answer"],comparingTo:["an answer"]), 1)
        
    }
    
    func test_oneMatchingAnswerOneNonMatching_scoresOne(){
        
        let score = BasicScore.score(
            for:["an answer","wrong"],
            comparingTo:["an answer","another answer"]
        )
        XCTAssertEqual(score, 1)
        
    }
    
    func test_twoMachingAnswers_scoresTwo(){
        
        let score = BasicScore.score(
            for:["an answer","another answer"],
            comparingTo:["an answer","another answer"]
        )
        
        XCTAssertEqual(score, 2)
        
    }
    
    func test_withTooManyAnswers_twoMachingAnswers_scoresTwo(){
        
        let score = BasicScore.score(
            for:["an answer","another answer","an extra answer"],
            comparingTo:["an answer","another answer"]
        )
        
        XCTAssertEqual(score, 2)
        
    }
    
    
    func test_withTooManyCorrectAnswers_oneMachingAnswers_scoresOne(){
        
        let score = BasicScore.score(
            for:["not matching","another answer"],
            comparingTo:["an answer","another answer","an extra answer"]
        )
        
        XCTAssertEqual(score, 1)
        
    }
    
}
