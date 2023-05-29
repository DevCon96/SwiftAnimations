//
//  SwiftUIView.swift
//  
//
//  Created by Connor Jones on 27/05/2023.
//

import SwiftUI

@available(iOS 14.0, *)
public struct AnimatingProgressView: View {
    @State private(set) var progress: Double
    @State private var isAnimating = false

    private var animation: Animation {
        .linear(duration: 3)
        .speed(3)
        .delay(1)
        .repeatCount(5)
    }

    public init(progress: Double) {
        self.progress = progress
    }

    public var body: some View {
        ProgressView("Loading", value: progress)
            .animation(animation, value: isAnimating)
            .onAppear {
                isAnimating = true
                progress += 0.1
            }
            .accentColor(Color.orange)
    }
}

@available(iOS 14.0, *)
public struct AnimatingProgressView_Previews: PreviewProvider {
    public static var previews: some View {
        AnimatingProgressView(progress: 0.2)
            .frame(width: 300, height: 50)

    }
}
