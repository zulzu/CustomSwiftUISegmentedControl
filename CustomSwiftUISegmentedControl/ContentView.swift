
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
                Text("View One")
            } else if segmentSelection == 1 {
                Text("View Two")
            } else if segmentSelection == 2 {
                Text("View Three")
            } else if segmentSelection == 3 {
                Text("View Four")
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
