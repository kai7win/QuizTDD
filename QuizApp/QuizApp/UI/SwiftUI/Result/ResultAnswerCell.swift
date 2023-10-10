//
//  ResultAnswerCell.swift
//  QuizApp
//
//  Created by Thomas on 2023/10/11.
//

import SwiftUI

struct ResultAnswerCell: View {
    
    let model:PresentableAnswer
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text(model.question)
                .font(.title)
            Text(model.answer)
                .font(.title2)
                .foregroundColor(.green)
            if let wrongAnswer = model.wrongAnswer{
                Text(wrongAnswer)
                    .font(.title2)
                    .foregroundColor(.red)
            }
        }.padding(.vertical)
    }
}

struct ResultAnswerCell_Previews: PreviewProvider {
    static var previews: some View {
        ResultAnswerCell(model: .init(question: "A question", answer: "A correct answer", wrongAnswer: "A wrong Answer"))
            .previewLayout(.sizeThatFits)
    }
}
