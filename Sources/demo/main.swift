import GTK

let app = Application(id: "org.gtk.demo")
app.onActivate = { application in 
    let window = ApplicationWindow(for: application)
    let toggle = ToggleButton()
    toggle.add(Button(label: "Here"))
    window.add(toggle)
    window.showAll()
}
app.run()