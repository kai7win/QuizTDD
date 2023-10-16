//
//  Question.swift
//  QuizApp
//
//  Created by Thomas on 2023/9/9.
//

import Foundation

public enum Question<T:Hashable>:Hashable{
    case singleAnswer(T)
    case multipleAnswer(T)
}
