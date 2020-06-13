import GTK

let app = Application(id: "org.gtk.example")
app.onActivate = { application in
    let window = ApplicationWindow(for: application)
    window.title = "Window"
    window.defaultSize = Size(width: 200, height: 200)

    let buttonBox = ButtonBox(.horizontal)
    window.add(buttonBox)

    let button = Button(label: "Hello World")
    button.onClick = { [unowned window] button in
        print("Hello World")
        window.close()
    }
    buttonBox.add(button)
    
    window.showAll()
}
app.run()
