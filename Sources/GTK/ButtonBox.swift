import CGTK

public class ButtonBox: Box {
    
    public init(_ orientation: Orientation) {
        super.init(gtk_button_box_new(orientation.toGTK()))
    }
}
