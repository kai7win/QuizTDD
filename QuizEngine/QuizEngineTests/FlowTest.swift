//
//  FlowTest.swift
//  QuizEngineTests
//
//  Created by Kai Chi Tsao on 2023/8/15.
//

import Foundation
import XCTest
@testable import QuizEngine

class FlowTest:XCTestCase{
    
    
    
    func test_start_withNoQuestions_doesNotDelegateQuestionHandling(){
        
        makeSUT(questions:[]).start()
        
        XCTAssertTrue(delegate.handledQuestions.isEmpty)
    }
    
    
    func test_start_withOneQuestion_delegatesCorrectQuestionHandling(){
        
        makeSUT(questions:["Q1"]).start()
        
        XCTAssertEqual(delegate.handledQuestions, ["Q1"])
        
    }
    
    func test_start_withOneQuestion_delegatesAnotherCorrectQuestionHandling(){
        
        makeSUT(questions:["Q2"]).start()
        
        XCTAssertEqual(delegate.handledQuestions, ["Q2"])
        
    }
    
    func test_start_withTwoQuestions_delegatesFirstQuestionHandling(){
        
        makeSUT(questions:["Q1","Q2"]).start()
        
        XCTAssertEqual(delegate.handledQuestions, ["Q1"])
        
    }
    
    func test_startTwice_withTwoQuestions_delegatesFirstQuestionHandlingTwice(){
        
        let sut = makeSUT(questions:["Q1","Q2"])
        
        sut.start()
        sut.start()
        
        XCTAssertEqual(delegate.handledQuestions, ["Q1","Q1"])
        
    }
    
    
    func test_startAndAnswerFirstAndSecondQuestion_withThreeQuestions_delegatesSecondAndThirdQuestionHandling(){
        
        
        let sut = makeSUT(questions:["Q1","Q2","Q3"])
        
        sut.start()
        delegate.answerCallback("A1")
        delegate.answerCallback("A2")
        
        XCTAssertEqual(delegate.handledQuestions, ["Q1","Q2","Q3"])
        
    }
    
    func test_startAndAnswerFirstQuestion_withOneQuestion_doesNotDelegatesAnotherQuestionHandling(){
        
        
        let sut = makeSUT(questions:["Q1"])
        
        sut.start()
        delegate.answerCallback("A1")
        
        XCTAssertEqual(delegate.handledQuestions, ["Q1"])
        
    }
    
    
    func test_start_withNoQuestions_delegatesResultHandling(){
        
        makeSUT(questions:[]).start()
        
        XCTAssertEqual(delegate.handledResult!.answers,[:])
    }
    
    func test_start_withOneQuestion_doesNotDelegatesResultHandling(){
        makeSUT(questions:["Q1"]).start()
        XCTAssertNil(delegate.handledResult)
    }
    
    func test_startAndAnswerFirst_withTwoQuestions_doesNottDelegatesResultHandling(){
        
        
        let sut = makeSUT(questions:["Q1","Q2"])
        
        sut.start()
        delegate.answerCallback("A1")
        
        XCTAssertNil(delegate.handledResult)
    }
    
    
    func test_startAndAnswerFirstAndSecondQuestion_withTwoQuestions_delegatesResultHandling(){
        
        
        let sut = makeSUT(questions:["Q1","Q2"])
        
        sut.start()
        delegate.answerCallback("A1")
        delegate.answerCallback("A2")
        
        XCTAssertEqual(delegate.handledResult!.answers, ["Q1":"A1","Q2":"A2"])
    }
    
    
    func test_startAndAnswerFirstAndSecondQuestion_withTwoQuestions_scores(){
        
        let sut = makeSUT(questions:["Q1","Q2"],scoring: { _ in 10 })
        
        sut.start()
        delegate.answerCallback("A1")
        delegate.answerCallback("A2")
        
        XCTAssertEqual(delegate.handledResult!.score, 10)
    }
    
    func test_startAndAnswerFirstAndSecondQuestion_withTwoQuestions_scoresWithRightAnswers(){
        var receiveAnswers = [String:String]()
        let sut = makeSUT(questions:["Q1","Q2"],scoring: { answers in
            receiveAnswers = answers
            return 20
        })
        
        sut.start()
        delegate.answerCallback("A1")
        delegate.answerCallback("A2")
        
        XCTAssertEqual(receiveAnswers,  ["Q1":"A1","Q2":"A2"])
    }
    
    
    // MARK: - Helpers
    private let delegate = DelegateSpy()
    
    private weak var weakSUT:Flow<DelegateSpy>?
    
    
    override func tearDown() {
        super.tearDown()
        
        XCTAssertNil(weakSUT,"Memory leak detected. Weak reference to the SUT instance is not nil)")
    }
    
    private func makeSUT(questions:[String],
                 scoring:@escaping ([String:String]) -> Int =  { _ in 0 }
    ) -> Flow<DelegateSpy>{
        
        let sut = Flow(questions: questions,delegate:delegate,scoring: scoring)
        
        weakSUT = sut
        
        return sut
    }
    
    
    private class DelegateSpy: QuizDelegate {
        
        var handledQuestions: [String] = []
        var handledResult: Result<String, String>? = nil
        
        var answerCallback: (String) -> Void = { _ in }
        
        func answer(for question: String, completion: @escaping (String) -> Void) {
            handledQuestions.append(question)
            self.answerCallback = completion
        }
       
        func handle(result: Result<String, String>) {
            handledResult = result
        }
        
    }

    
}
