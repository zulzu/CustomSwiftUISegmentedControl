
import SwiftUI

struct ContentView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    
    // # Private/Fileprivate
    // The selected segment of the Segmented Control
    @State private var segmentSelection: Int = 0
    // The padding value used for the view
    private var mainPadding: CGFloat = 20
    
    // # Body
    var body: some View {
        
        VStack {
            
            CustomSegmentedControl(selection: $segmentSelection, size: CGSize(width: UIScreen.main.bounds.width - (mainPadding * 2), height: 48), segmentLabels: ["One", "Two", "Three", "Four"])
                .padding(.top, mainPadding)
            
            Spacer()
            
            if segmentSelection == 0 {
                
                ZStack {
                    
                    Color.red
                        .modifier(SegmentedControlViewBackground(padding: mainPadding))
                    Text("View One")
                }
            } else if segmentSelection == 1 {
                
                ZStack {
                    
                    Color.green
                        .modifier(SegmentedControlViewBackground(padding: mainPadding))
                    Text("View Two")
                }
            } else if segmentSelection == 2 {
                
                ZStack {
                    
                    Color.blue
                        .modifier(SegmentedControlViewBackground(padding: mainPadding))
                    Text("View Three")
                }
            } else if segmentSelection == 3 {
                
                ZStack {
                    
                    Color.yellow
                        .modifier(SegmentedControlViewBackground(padding: mainPadding))
                    Text("View Four")
                }
            } else {
                Text("Content missing")
            }
            
            Spacer()
        }
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    
    //=======================================
    // MARK: Private Methods
    //=======================================
}


//=======================================
// MARK: Previews
//=======================================
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
