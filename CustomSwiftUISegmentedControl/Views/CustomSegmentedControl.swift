
import SwiftUI

struct CustomSegmentedControl: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    
    // # Private/Fileprivate
    private let size: CGSize
    private let segmentLabels: [String]

    // # Body
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            // # Background shape
            RoundedRectangle(cornerRadius: 10)
                .frame(width: size.width, height: size.height)
                .foregroundColor(.gray)
                .opacity(0.2)
            
            // # Selection background
            RoundedRectangle(cornerRadius: 10)
                .frame(width: segmentWidth(size), height: size.height - 6)
                .foregroundColor(.black)
            
            // # Labels
            HStack(spacing: 0) {
                ForEach(0..<segmentLabels.count) { idx in
                    SegmentLabel(title: segmentLabels[idx], width: segmentWidth(size), textColour: idx == 0 ? Color.white : Color.black)
                }
            }
        }
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    public init(size: CGSize, segmentLabels: [String]) {
        self.size = size
        self.segmentLabels = segmentLabels
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    /// Calculates the width of a segment
    private func segmentWidth(_ mainSize: CGSize) -> CGFloat {
        var width = (mainSize.width / CGFloat(segmentLabels.count))
        if width < 0 {
            width = 0
        }
        return width
    }
}


//=======================================
// MARK: Subviews
//=======================================
fileprivate struct SegmentLabel: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    let title: String
    let width: CGFloat
    let textColour: Color
    
    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        Text(title)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: false)
            .foregroundColor(textColour)
            .frame(width: width)
            .contentShape(Rectangle())
    }
}


//=======================================
// MARK: Previews
//=======================================
struct CustomSegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentedControl(size: CGSize(width: 300, height: 48), segmentLabels: ["One", "Two", "Three", "Four"])
    }
}
