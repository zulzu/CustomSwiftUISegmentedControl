
import SwiftUI

struct CustomSegmentedControl: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    
    // # Private/Fileprivate
    private let size: CGSize
    
    // # Body
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            // # Background shape
            RoundedRectangle(cornerRadius: 10)
                .frame(width: size.width, height: size.height)
                .foregroundColor(.gray)
                .opacity(0.2)
        }
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    public init(size: CGSize) {
        self.size = size
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
}


//=======================================
// MARK: Previews
//=======================================
struct CustomSegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentedControl(size: CGSize(width: UIScreen.main.bounds.width - 40, height: 48))
    }
}
