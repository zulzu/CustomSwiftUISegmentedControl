
import SwiftUI

struct ContentView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    
    // # Private/Fileprivate
    @State private var segmentSelection: Int = 0
    
    // # Body
    var body: some View {
        
        CustomSegmentedControl(selection: $segmentSelection, size: CGSize(width: UIScreen.main.bounds.width, height: 48), segmentLabels: ["One", "Two", "Three", "Four"])
        
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
