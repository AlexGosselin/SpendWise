//
//  HexagonUIView.swift
//  SpendWise
//
//  Created by ayomide olopha on 07/11/2023.
//

import SwiftUI

struct HexagonUIView: View {
    var body: some View {
        Canvas { context, size in
            let image = context.resolve(Image(systemName: "hexagon.fill"))
            let frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            context.draw(image, in: frame)
        }
        .frame(width: 200, height: 220)
        .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    HexagonUIView()
}
