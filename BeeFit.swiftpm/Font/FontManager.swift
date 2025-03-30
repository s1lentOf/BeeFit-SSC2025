import SwiftUI

class FontManager: ObservableObject {
    @Published var font1: Font? = nil
    @Published var font2: Font? = nil
    @Published var font3: Font? = nil
    
    init() {
        font1 = loadFont(named: "Nunito-Bold", size: 40)
        font2 = loadFont(named: "Nunito-Regular", size: 16)
        font3 = loadFont(named: "Nunito-Bold", size: 80)
    }
    
    private func loadFont(named fontName: String, size: CGFloat) -> Font? {
        guard let cfURL = Bundle.main.url(forResource: fontName, withExtension: "ttf") as CFURL? else {
            print("Font file \(fontName) not found!")
            return nil
        }
        
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        
        return UIFont(name: fontName, size: size).map { Font($0) }
    }
}

