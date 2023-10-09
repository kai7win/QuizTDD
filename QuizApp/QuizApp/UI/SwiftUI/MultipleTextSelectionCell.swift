//
//  MultipleTextSelectionCell.swift
//  QuizApp
//
//  Created by Thomas on 2023/10/10.
//

import SwiftUI

struct MultipleTextSelectionCell: View {
    
    @Binding var option:MultipleSelectionOption
    
    var body: some View {
        Button(action: { option.select() }) {
            HStack {
                Rectangle()
                    .strokeBorder(option.isSelected ? .blue:.secondary,lineWidth:2.5)
                    .overlay(
                        Rectangle()
                            .fill(option.isSelected ? .blue:.clear)
                            .frame(width: 26,height: 26)
                    
                    )
                    .frame(width: 40,height: 40)
                Text(option.text)
                    .font(.title)
                    .foregroundColor(option.isSelected ? .blue:.secondary)
                Spacer()
            }.padding()
        }
    }
}

struct MultipleTextSelectionCell_Previews: PreviewProvider {
    static var previews: some View {
            
        MultipleTextSelectionCell(option: .constant(.init(text: "A test",isSelected: false))).previewLayout(.sizeThatFits)
        
        MultipleTextSelectionCell(option: .constant(.init(text: "A test",isSelected: true))).previewLayout(.sizeThatFits)
        
    }
}
