//
//  DemoQuizData.swift
//  QuizApp
//
//  Created by Thomas on 2023/10/13.
//

import BasicQuizDomain

let demoQuiz = try!
    BasicQuizBuilder(
        singleAnswerQuestion: "What's Mike's nationality?",
        options: NonEmptyOptions("Canadian", "American", "Greek"),
        answer: "Greek"
    )
    .adding(
        multipleAnswerQuestion: "What are Caio's nationalities?",
        options: NonEmptyOptions("Portuguese", "American", "Brazilian"),
        answer: NonEmptyOptions("Portuguese", "Brazilian")
    )
    .adding(
        singleAnswerQuestion: "What's the capital of Brazil?",
        options: NonEmptyOptions("Sao Paulo", "Rio de Janeiro", "Brasilia"),
        answer: "Brasilia"
    )
    .build()
