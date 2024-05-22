import SwiftUI

struct MVPView: View {
    
    @State var progress:Float = 0
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            
            ProgressView("Changing...", value: progress)
                .progressViewStyle(.linear)
                .onReceive(timer) { time in
                    progress += 0.05
                }
                .onDisappear {
                    timer.upstream.connect().cancel()
                }
                .padding()
        }
        
    }
}

