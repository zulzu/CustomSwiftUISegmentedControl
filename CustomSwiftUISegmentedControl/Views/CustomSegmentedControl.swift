
import SwiftUI

struct CustomSegmentedControl: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    @Binding public var selection: Int
    
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
                .offset(x: calculateSegmentOffset(size))
            
            // # Labels
            HStack(spacing: 0) {
                ForEach(0..<segmentLabels.count) { idx in
                    SegmentLabel(title: segmentLabels[idx], width: segmentWidth(size), textColour: selection == idx ? Color.white : Color.black)
                        .onTapGesture {
                            selection = idx
                            print("\(idx)")
                        }
                }
            }
        }
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    public init(selection: Binding<Int>, size: CGSize, segmentLabels: [String]) {
        self._selection = selection
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
    
    /// Calculates the offset of a segment
    private func calculateSegmentOffset(_ mainSize: CGSize) -> CGFloat {
        segmentWidth(mainSize) * CGFloat(selection)
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
        CustomSegmentedControl(selection: Binding.constant(0), size: CGSize(width: UIScreen.main.bounds.width, height: 48), segmentLabels: ["One", "Two", "Three", "Four"])
    }
}
