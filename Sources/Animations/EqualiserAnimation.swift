//
//  SwiftUIView.swift
//  
//
//  Created by Connor Jones on 05/05/2023.
//

import SwiftUI

public struct EqualiserAnimation: View {
    @State private var drawingHeight: Bool = true
    private var heightAndWidth: CGFloat
    private var backgroundColor: Color
    private var accentColour: Color
    private var opacityLevel: CGFloat

    private let randomSpeeds: [Double] = [
        Double.random(in: 1...2),
        Double.random(in: 1...2),
        Double.random(in: 1...2),
        Double.random(in: 1...2),
        Double.random(in: 1...2)
    ]

    private let randomHeights: [Double] = [
        Double.random(in: 0...0.7),
        Double.random(in: 0...0.7),
        Double.random(in: 0...0.7),
        Double.random(in: 0...0.7),
        Double.random(in: 0...0.7)
    ]

    public var animation: Animation {
        .linear(duration: 0.6)
        .repeatForever()
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 2) {
            ForEach(0...4, id: \.self) { barValue in
                bar(low: randomHeights[barValue])
                    .animation(animation.speed(randomSpeeds[barValue]), value: drawingHeight)
            }
        }
        .onAppear {
            drawingHeight.toggle()
        }
        .frame(width: heightAndWidth)
        .padding()
        .background(Color.black)
        .opacity(opacityLevel)
    }

    public init(heightAndWidth: CGFloat,
                numberOfBars: Int = 5,
                accentColour: Color = .white,
                backgroundColour: Color = .black,
                opacityLevel: CGFloat = 0.5) {
        self.heightAndWidth = heightAndWidth
        self.accentColour = accentColour
        self.backgroundColor = backgroundColour
        self.opacityLevel = opacityLevel
    }

    private func bar(low: CGFloat = 0, high: CGFloat = 0.7) -> some View {
        RoundedRectangle(cornerRadius: 2.0)
            .fill(.white)
            .opacity(opacityLevel)
            .frame(height: (drawingHeight ? high : low) * heightAndWidth,
                    alignment: .center)
    }
}

public struct EqualiserAnimation_Previews: PreviewProvider {
    public static var previews: some View {
        EqualiserAnimation(heightAndWidth: 60, numberOfBars: 5)
//            .frame(width: 60)
    }
}
