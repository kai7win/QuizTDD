//
//  Game.swift
//  QuizEngineTests
//
//  Created by Thomas on 2023/9/9.
//

import Foundation

@available(*,deprecated)
public class Game<Question,Answer,R:Router>{
    let flow:Any
    
    init(flow: Any) {
        self.flow = flow
    }
}



@available(*,deprecated)
public func startGame<Question,Answer:Equatable,R:Router>(questions:[Question],router:R,correctAnswers:[Question:Answer]) -> Game<Question,Answer,R>  where R.Question == Question,R.Answer == Answer  {

    let flow = Flow(questions: questions, router: QuizDelegateToRouterAdapter(router), scoring: { scoring($0, correctAnswers: correctAnswers) })
    flow.start()
    return Game(flow: flow)
}

@available(*,deprecated)
private class QuizDelegateToRouterAdapter<R:Router>:QuizDelegate{
    
    private let router:R
    
    init(_ router: R) {
        self.router = router
    }
    
    func handle(question: R.Question, answerCallback: @escaping (R.Answer) -> Void) {
        router.routeTo(question: question, answerCallback: answerCallback)
    }
    
    func handle(result: Result<R.Question, R.Answer>) {
        router.routeTo(result: result)
    }
    
    
}



private func scoring<Question,Answer:Equatable>(_ answers:[Question:Answer],correctAnswers:[Question:Answer]) -> Int{
    return answers.reduce(0){ (score,tuple) in
        return score + (correctAnswers[tuple.key] == tuple.value ? 1 : 0)
    }
}
