//
//  BasicLoadingSpinner.swift
//  
//
//  Created by Connor Jones on 05/05/2023.
//

import SwiftUI

public struct BasicLoadingSpinner: Shape {
    @State private var progress: Double
    private var lineWidth: Double

    public init(progress: Double = 0.0, lineWidth: Double = 3) {
        self.progress = progress
        self.lineWidth = lineWidth
    }

    public var body: some View {
        SpinnerCircle(progress: 0, lineWidth: 3)
    }

    public func path(in rect: CGRect) -> Path {
        let end = progress * progress * .pi * 2.0
        let start = end + end

        let halfWidth = rect.width / 2.0 - lineWidth / 2.0
        let initialCircleSize = lineWidth / 4.0

        var path = Path()
        path.addArc(center: .init(x: rect.midX, y: rect.midY),
                    radius: initialCircleSize * (1.0 - progress) + halfWidth * sin(progress * .pi),
                    startAngle: .radians(start),
                    endAngle: .radians(end),
                    clockwise: false)
        return path
    }
}

public struct BasicLoadingSpinner_Previews: PreviewProvider {
    public static var previews: some View {
        BasicLoadingSpinner()
    }
}
