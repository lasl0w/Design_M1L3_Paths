//
//  ContentView.swift
//  Design_M1L3_Paths
//
//  Created by tom montgomery on 8/28/23.
//

import SwiftUI

struct ContentView: View {
    
    // NOTE - it's one or the other - .stroke or .foreground, NOT BOTH
    
    // Can put a path into a property and use it in a loop
    //let customShape: Path = Path()
    let customShape2: Path = {
        
        // manipulate it before you return it
        return Path({ path in
            path.move(to: CGPoint(x: 100, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 200))
            path.addLine(to: CGPoint(x: 200, y: 200))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 100))
            path.closeSubpath()
            path.move(to: CGPoint(x: 100, y: 300))
            path.addLines([
                CGPoint(x: 100, y: 400),
                CGPoint(x: 200, y: 400),
                CGPoint(x: 200, y: 300),
                CGPoint(x: 100, y: 300),
                CGPoint(x: 100, y: 400)
            ])
            
        })
        // modifiers need to be applied on the view, not in the computed prop
       // Don't forget to end with the parens ()
    }()
    
    var body: some View {
        VStack {
            // One path, two shapes.  Transform, rotate, etc
            Path ({ path in
                // series of commands to draw your path shape
                path.move(to: CGPoint(x: 100, y: 100))
                // "move the pencil to 100, 100
                // draw a line straight down. x stays the same, y increases
                path.addLine(to: CGPoint(x: 100, y: 200))
                path.addLine(to: CGPoint(x: 200, y: 200))
                // back up - vertical line
                path.addLine(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 100))
                path.closeSubpath()
                // allow yourself to make a new shape in the current path
                
                path.move(to: CGPoint(x: 100, y: 300))
                path.addLines([
                    CGPoint(x: 100, y: 400),
                    CGPoint(x: 200, y: 400),
                    CGPoint(x: 200, y: 300),
                    CGPoint(x: 100, y: 300),
                    CGPoint(x: 100, y: 400)
                ])
            })
            //.fill(Color.mint)
            //.foregroundColor(.blue)
            // stroke allows you to see the lines as you go
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 2))
            .rotationEffect(Angle(degrees: 30))
            .scaleEffect(0.8)
            
            customShape2
                .fill(Color.mint)
                .rotationEffect(Angle(degrees: -30))
            // note - rotation is on the center of the blue frame, not the whole view
            // could specify a frame to rotate around (exactly the height/width of the path)
            
            // fill your custom shape with a clipped image
            Image("books")
                .resizable()
                .clipShape(customShape2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
