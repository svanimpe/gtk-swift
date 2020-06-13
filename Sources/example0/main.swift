import GTK

let app = Application(id: "org.gtk.example")
app.onActivate = { application in
    let window = ApplicationWindow(for: application)
    window.title = "Window"
    window.defaultSize = Size(width: 200, height: 200)
    window.showAll()
}
app.run()
