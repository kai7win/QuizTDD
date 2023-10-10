//
//  SingleTextSelectionCell.swift
//  QuizApp
//
//  Created by Thomas on 2023/10/9.
//

import SwiftUI

struct SingleTextSelectionCell: View {
    
    let text:String
    let selection:()->Void
    
    var body: some View {
        Button(action: { selection() }) {
            HStack {
                Circle()
                    .stroke(Color.secondary,lineWidth:2.5)
                    .frame(width: 40,height: 40)
                Text(text)
                    .font(.title)
                    .foregroundColor(.secondary)
                Spacer()
            }.padding()
        }
    }
}

struct SingleTextSelectionCell_Previews: PreviewProvider {
    static var previews: some View {
        SingleTextSelectionCell(text: "A text", selection: { })
            .previewLayout(.sizeThatFits)
    }
}
