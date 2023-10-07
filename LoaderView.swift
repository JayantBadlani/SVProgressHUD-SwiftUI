//
//  LoaderView.swift
//  Pro Caller
//
//  Created by Jayant on 07/10/23.
//


import SwiftUI

struct LoaderView: View {
    
    var text: String?
    var userInteractionEnable: Bool = false
    var backgroundColor: Color = .white
    var tintColor: Color = .black
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            if userInteractionEnable {
                Color.clear
            } else {
                Color.black.opacity(0.00001)
                    .onTapGesture { /* Do nothing*/ }
            }
            
            VStack(spacing: 20) {
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(
                        AngularGradient(gradient: Gradient(colors: [tintColor.opacity(0), tintColor.opacity(0.8)]),
                                        center: .center,
                                        startAngle: .degrees(0),
                                        endAngle: .degrees(360)),
                        style: StrokeStyle(lineWidth: 2, lineCap: .round)
                    )
                    .frame(width: 47, height: 47)
                    .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                
                if let text = text, !text.isEmpty {
                    Text(text)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(tintColor)
                        .frame(maxWidth: UIScreen.main.bounds.width - 150)
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
            .background {
                Rectangle()
                    .cornerRadius(15)
                    .foregroundColor(backgroundColor)
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                isAnimating = true
            }
        }
        .onDisappear {
            isAnimating = false
        }
        .ignoresSafeArea()
    }
}

struct LoaderViewModifier: ViewModifier {
    
    @Binding var isShow: Bool
    var text: String?
    var userInteractionEnable: Bool = false
    var backgroundColor: Color = .white
    var tintColor: Color = .black
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isShow {
                LoaderView(text: text, userInteractionEnable: userInteractionEnable, backgroundColor: backgroundColor, tintColor: tintColor)
                    .ignoresSafeArea()
            }
        }
    }
}

extension View {
    func loader(isShow: Binding<Bool>, userInteractionEnable: Bool = false, backgroundColor: Color = .white, text: String? = nil) -> some View {
        self.modifier(LoaderViewModifier(isShow: isShow, text: text, userInteractionEnable: userInteractionEnable, backgroundColor: backgroundColor))
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        Rectangle()
            .foregroundColor(.accentColor)
            .edgesIgnoringSafeArea(.all)
            .loader(isShow: .constant(true), text: "Loading...")
    }
}


