import SwiftUI
import Popovers

struct DismissalView2: View {
    @State var present = false
    
    var body: some View {
        ExampleRow(
            image: "xmark",
            title: "Advanced Dismissal 2",
            color: 0xCB9400
        ) {
            present = true
        }
        .popover(
            present: $present,
            attributes: {
                $0.sourceFrameInset = UIEdgeInsets(16)
                $0.position = .relative(
                    popoverAnchors: [
                        .left,
                        .right,
                        .bottom,
                        .top,
                    ]
                )
                $0.dismissal.mode = .tapOutside
                $0.tag = "Advanced Dismissal 1"
                $0.dismissal.excludedFrames = {
                    [
                        Popovers.frameTagged("Frame-Tagged View")
                    ]
                }
            }
        ) {
            DismissalPopover2(present: $present)
        }
    }
}

struct DismissalPopover2: View {
    @Binding var present: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("This popover can be dismissed by tapping outside. Except...")
            
            HStack {
                ExampleImage("minus.square.fill", color: 0xCB9400)
                Text("The Frame-Tagged View is excluded from auto dismissal.")
            }
        }
        .frame(maxWidth: 300)
        .padding()
        .background(.background)
        .cornerRadius(12)
        .shadow(radius: 1)
    }
}