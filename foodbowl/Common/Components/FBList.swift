//
//  FBList.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/9/22.
//

import SwiftUI


public struct FBList<Content>: View where Content: View {
    @Binding var contentOffset: CGFloat
    
    let content: Content
    
    public init(contentOffset: Binding<CGFloat>, @ViewBuilder content: () -> Content) {
        self._contentOffset = contentOffset
        self.content = content()
    }
    
    public var body: some View {
        GeometryReader { outside in
            ScrollView(.vertical) {
                GeometryReader { inside in
                    VStack {
                        self.content
                    }
                    .onChange(of: inside.frame(in: .global).minY) { _ in
                        self.contentOffset = outside.frame(in: .global).minY - inside.frame(in: .global).minY
                    }
                }
            }
        }
    }
}
