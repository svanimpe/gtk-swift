import CGTK

public class ToggleButton: Button {

    override init(_ pointer: UnsafeMutablePointer<GtkWidget>) {
        super.init(pointer)
    }

    public convenience init() {
        self.init(gtk_toggle_button_new())
    }
    
    public convenience init(label: String, hasMnemonic: Bool = false) {
        if hasMnemonic {
            self.init(gtk_toggle_button_new_with_mnemonic(label))
        } else {
            self.init(gtk_toggle_button_new_with_label(label))
        }
    }
}
