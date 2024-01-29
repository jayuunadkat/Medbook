//
//  SwipeActionModifier.swift
//  ULeap
//
//  Created by differenz210 on 19/01/24.
//

import Foundation
import SwiftUI

// MARK: - SwipeActionsModifier
struct SwipeActionsModifier: ViewModifier {
    @AppStorage("isSwipeActive") var isSwipeActive = false
    
    @State private var contentWidth: CGFloat = 0.0
    @State private var isDragging: Bool = false
    @State private var isDeleting: Bool = false
    @State private var isActive: Bool = false
    @State private var dragX: CGFloat = 0.0
    @State private var iconOffset: CGFloat = 40.0
    
    let color: Color
    let iconLast: String
    let action: (_ event: EventType) -> Void
    
    let miniumDistance: CGFloat = 20
    
    func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
                .overlay(
                    GeometryReader { geo in
                        Color.clear.onAppear { self.contentWidth = geo.size.width }
                    }
                )
                .offset(x: -self.dragX)
            
            Group {
                self.color
                HStack(spacing: Constant.setSpace._14Padding) {
                    Button {
                        withAnimation {
                            self.dragX = 0.0
                            self.iconOffset = 40.0
                            self.action(.BookMark)
                            self.isSwipeActive = false
                        }
                    } label: {
                        Image(systemName: self.iconLast)
                            .renderingMode(.template)
                            .bold()
                            .foregroundColor(.AppWhite)
                            .padding(.all, Constant.setSpace._8Padding)
                            .background(Color.AppParrotColor)
                            .cornerRadius(Constant.setSpace._8Padding)
                            .offset(x: self.isDeleting ? (40.0 - self.dragX / 2.0) : self.iconOffset)
                    }
                    
                }
            }
            .frame(width: max(self.dragX, 0.0))
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                self.isActive = false
                self.dragX = 0.0
                self.iconOffset = 40.0
                self.isSwipeActive = false
            }
        }
        .gesture(DragGesture(minimumDistance: self.miniumDistance)
            .onChanged { value in
                if !self.isDragging && !self.isActive {
                    self.isSwipeActive = false
                    self.isDragging = true
                }
                
                if value.translation.width < 0.0 {
                    self.dragX = -min(value.translation.width + self.miniumDistance, 0.0)
                } else if self.isActive {
                    self.dragX = max(80.0 - value.translation.width + self.miniumDistance, -30.0)
                }
                
                self.iconOffset = self.dragX > 80.0 ? (-40.0 + self.dragX / 2.0) : (40.0 - self.dragX / 2.0)
                
                withAnimation(.easeOut(duration: 0.3)) { self.isDeleting = self.dragX > self.contentWidth * 0.75 }
                
                if value.translation.width <= -self.contentWidth {
                    withAnimation {
                        self.action(.BookMark)
                    }
                    
                    self.dragX = 0.0
                    
                    return
                }
            }
            .onEnded { value in
                withAnimation(.easeOut) {
                    self.isDragging = false
                    
                    if value.translation.width < -60.0 && !self.isActive {
                        self.isActive = true
                        self.isSwipeActive = true
                    } else {
                        self.isActive = false
                        self.isSwipeActive = false
                    }
                    
                    if self.isDeleting {
                        self.action(.BookMark)
                        self.dragX = 0.0
                        
                        return
                    }
                    
                    if self.isActive {
                        self.dragX = 80.0
                        self.iconOffset = 0.0
                        
                        return
                    }
                    
                    self.dragX = 0.0
                    self.isDeleting = false
                }
            }
        )
        .onChange(of: self.isSwipeActive) { newValue in
            if newValue == false && !self.isDragging {
                withAnimation {
                    self.dragX = 0.0
                    self.isActive = false
                    self.isDeleting = false
                    self.iconOffset = 40.0
                }
            }
        }
    }
}


///`EventType`
extension SwipeActionsModifier {
    enum EventType {
        case BookMark
    }
}
