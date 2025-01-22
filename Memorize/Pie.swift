// Pie

import SwiftUI
import CoreGraphics

struct Pie: Shape {
    var startAngle: Angle = .zero
    let endAngle: Angle
    var clockwise: Bool = true
    
    func path(in rect: CGRect) -> Path {
        let startAngle = self.startAngle - .degrees(90)
        let endAngle = self.endAngle - .degrees(90)
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: !clockwise
        )
        p.addLine(to: center)
        return p
    }
}

#Preview {
    Pie(endAngle: .degrees(240)).stroke(style: .init(lineWidth: 1))
}
