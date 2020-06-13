import CGTK

public class Button: Bin {

    override init(_ pointer: UnsafeMutablePointer<GtkWidget>) {
        super.init(pointer)
        
        let handler: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
            sender, data in
            let button = Unmanaged<Button>.fromOpaque(data).takeUnretainedValue()
            button.onClick(button)
        }

        g_signal_connect_data(
            pointer, "clicked",
            unsafeBitCast(handler, to: GCallback.self),
            Unmanaged.passUnretained(self).toOpaque(),
            nil, GConnectFlags(0)
        )
    }

    public convenience init() {
        self.init(gtk_button_new())
    }
    
    public convenience init(label: String, hasMnemonic: Bool = false) {
        if hasMnemonic {
            self.init(gtk_button_new_with_mnemonic(label))
        } else {
            self.init(gtk_button_new_with_label(label))
        }
    }

    public var onClick: (Button) -> Void = { _ in }
}
