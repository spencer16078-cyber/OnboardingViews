//
//  TextOptions.swift
//  OnboardingViews
//
//  Created by Spencer Searle on 10/3/25.
//

/*
Montserrat font styles
 
Family: Montserrat
   Montserrat-Bold
   Montserrat-Medium
   Montserrat-Regular
   Montserrat-SemiBold
*/


// How to check what fonts are available
//
//import SwiftUI
//
//struct TextOptions: View {
//    var body: some View {
//        Text("Check console for font list")
//            .onAppear {
//                for family in UIFont.familyNames.sorted() {
//                    print("Family: \(family)")
//                    for name in UIFont.fontNames(forFamilyName: family).sorted() {
//                        print("   \(name)")
//                    }
//                }
//            }
//    }
//}
//
//#Preview {
//    TextOptions()
//}


/*
 Every other default font style
 
 Family: Academy Engraved LET
    AcademyEngravedLetPlain
 Family: Al Nile
    AlNile
    AlNile-Bold
 Family: American Typewriter
    AmericanTypewriter
    AmericanTypewriter-Bold
    AmericanTypewriter-Condensed
    AmericanTypewriter-CondensedBold
    AmericanTypewriter-CondensedLight
    AmericanTypewriter-Light
    AmericanTypewriter-Semibold
 Family: Apple Color Emoji
    AppleColorEmoji
 Family: Apple SD Gothic Neo
    AppleSDGothicNeo-Bold
    AppleSDGothicNeo-Light
    AppleSDGothicNeo-Medium
    AppleSDGothicNeo-Regular
    AppleSDGothicNeo-SemiBold
    AppleSDGothicNeo-Thin
    AppleSDGothicNeo-UltraLight
 Family: Apple Symbols
    AppleSymbols
 Family: Arial
    Arial-BoldItalicMT
    Arial-BoldMT
    Arial-ItalicMT
    ArialMT
 Family: Arial Hebrew
    ArialHebrew
    ArialHebrew-Bold
    ArialHebrew-Light
 Family: Arial Rounded MT Bold
    ArialRoundedMTBold
 Family: Avenir
    Avenir-Black
    Avenir-BlackOblique
    Avenir-Book
    Avenir-BookOblique
    Avenir-Heavy
    Avenir-HeavyOblique
    Avenir-Light
    Avenir-LightOblique
    Avenir-Medium
    Avenir-MediumOblique
    Avenir-Oblique
    Avenir-Roman
 Family: Avenir Next
    AvenirNext-Bold
    AvenirNext-BoldItalic
    AvenirNext-DemiBold
    AvenirNext-DemiBoldItalic
    AvenirNext-Heavy
    AvenirNext-HeavyItalic
    AvenirNext-Italic
    AvenirNext-Medium
    AvenirNext-MediumItalic
    AvenirNext-Regular
    AvenirNext-UltraLight
    AvenirNext-UltraLightItalic
 Family: Avenir Next Condensed
    AvenirNextCondensed-Bold
    AvenirNextCondensed-BoldItalic
    AvenirNextCondensed-DemiBold
    AvenirNextCondensed-DemiBoldItalic
    AvenirNextCondensed-Heavy
    AvenirNextCondensed-HeavyItalic
    AvenirNextCondensed-Italic
    AvenirNextCondensed-Medium
    AvenirNextCondensed-MediumItalic
    AvenirNextCondensed-Regular
    AvenirNextCondensed-UltraLight
    AvenirNextCondensed-UltraLightItalic
 Family: Baskerville
    Baskerville
    Baskerville-Bold
    Baskerville-BoldItalic
    Baskerville-Italic
    Baskerville-SemiBold
    Baskerville-SemiBoldItalic
 Family: Bodoni 72
    BodoniSvtyTwoITCTT-Bold
    BodoniSvtyTwoITCTT-Book
    BodoniSvtyTwoITCTT-BookIta
 Family: Bodoni 72 Oldstyle
    BodoniSvtyTwoOSITCTT-Bold
    BodoniSvtyTwoOSITCTT-Book
    BodoniSvtyTwoOSITCTT-BookIt
 Family: Bodoni 72 Smallcaps
    BodoniSvtyTwoSCITCTT-Book
 Family: Bodoni Ornaments
    BodoniOrnamentsITCTT
 Family: Bradley Hand
    BradleyHandITCTT-Bold
 Family: Chalkboard SE
    ChalkboardSE-Bold
    ChalkboardSE-Light
    ChalkboardSE-Regular
 Family: Chalkduster
    Chalkduster
 Family: Charter
    Charter-Black
    Charter-BlackItalic
    Charter-Bold
    Charter-BoldItalic
    Charter-Italic
    Charter-Roman
 Family: Cochin
    Cochin
    Cochin-Bold
    Cochin-BoldItalic
    Cochin-Italic
 Family: Copperplate
    Copperplate
    Copperplate-Bold
    Copperplate-Light
 Family: Courier New
    CourierNewPS-BoldItalicMT
    CourierNewPS-BoldMT
    CourierNewPS-ItalicMT
    CourierNewPSMT
 Family: DIN Alternate
    DINAlternate-Bold
 Family: DIN Condensed
    DINCondensed-Bold
 Family: Damascus
    Damascus
    DamascusBold
    DamascusLight
    DamascusMedium
    DamascusSemiBold
 Family: Devanagari Sangam MN
    DevanagariSangamMN
    DevanagariSangamMN-Bold
 Family: Didot
    Didot
    Didot-Bold
    Didot-Italic
 Family: Euphemia UCAS
    EuphemiaUCAS
    EuphemiaUCAS-Bold
    EuphemiaUCAS-Italic
 Family: Farah
    Farah
 Family: Futura
    Futura-Bold
    Futura-CondensedExtraBold
    Futura-CondensedMedium
    Futura-Medium
    Futura-MediumItalic
 Family: Galvji
    Galvji
    Galvji-Bold
 Family: Geeza Pro
    GeezaPro
    GeezaPro-Bold
 Family: Georgia
    Georgia
    Georgia-Bold
    Georgia-BoldItalic
    Georgia-Italic
 Family: Gill Sans
    GillSans
    GillSans-Bold
    GillSans-BoldItalic
    GillSans-Italic
    GillSans-Light
    GillSans-LightItalic
    GillSans-SemiBold
    GillSans-SemiBoldItalic
    GillSans-UltraBold
 Family: Grantha Sangam MN
    GranthaSangamMN-Bold
    GranthaSangamMN-Regular
 Family: Helvetica
    Helvetica
    Helvetica-Bold
    Helvetica-BoldOblique
    Helvetica-Light
    Helvetica-LightOblique
    Helvetica-Oblique
 Family: Helvetica Neue
    HelveticaNeue
    HelveticaNeue-Bold
    HelveticaNeue-BoldItalic
    HelveticaNeue-CondensedBlack
    HelveticaNeue-CondensedBold
    HelveticaNeue-Italic
    HelveticaNeue-Light
    HelveticaNeue-LightItalic
    HelveticaNeue-Medium
    HelveticaNeue-MediumItalic
    HelveticaNeue-Thin
    HelveticaNeue-ThinItalic
    HelveticaNeue-UltraLight
    HelveticaNeue-UltraLightItalic
 Family: Hiragino Maru Gothic ProN
    HiraMaruProN-W4
 Family: Hiragino Mincho ProN
    HiraMinProN-W3
    HiraMinProN-W6
 Family: Hiragino Sans
    HiraginoSans-W3
    HiraginoSans-W4
    HiraginoSans-W5
    HiraginoSans-W6
    HiraginoSans-W7
    HiraginoSans-W8
 Family: Hoefler Text
    HoeflerText-Black
    HoeflerText-BlackItalic
    HoeflerText-Italic
    HoeflerText-Regular
 Family: Impact
    Impact
 Family: Kailasa
    Kailasa
    Kailasa-Bold
 Family: Kefa III
    KefaIII-Bold
    KefaIII-ExtraBold
    KefaIII-Light
    KefaIII-Regular
 Family: Khmer Sangam MN
    KhmerSangamMN
 Family: Kohinoor Bangla
    KohinoorBangla-Light
    KohinoorBangla-Regular
    KohinoorBangla-Semibold
 Family: Kohinoor Devanagari
    KohinoorDevanagari-Light
    KohinoorDevanagari-Regular
    KohinoorDevanagari-Semibold
 Family: Kohinoor Gujarati
    KohinoorGujarati-Bold
    KohinoorGujarati-Light
    KohinoorGujarati-Regular
 Family: Kohinoor Telugu
    KohinoorTelugu-Light
    KohinoorTelugu-Medium
    KohinoorTelugu-Regular
 Family: Lao Sangam MN
    LaoSangamMN
 Family: Malayalam Sangam MN
    MalayalamSangamMN
    MalayalamSangamMN-Bold
 Family: Marker Felt
    MarkerFelt-Thin
    MarkerFelt-Wide
 Family: Menlo
    Menlo-Bold
    Menlo-BoldItalic
    Menlo-Italic
    Menlo-Regular
 Family: Mishafi
    DiwanMishafi
 Family: Mukta Mahee
    MuktaMahee-Bold
    MuktaMahee-Light
    MuktaMahee-Regular
 Family: Myanmar Sangam MN
    MyanmarSangamMN
    MyanmarSangamMN-Bold
 Family: Noteworthy
    Noteworthy-Bold
    Noteworthy-Light
 Family: Noto Nastaliq Urdu
    NotoNastaliqUrdu
    NotoNastaliqUrdu-Bold
 Family: Noto Sans Kannada
    NotoSansKannada-Bold
    NotoSansKannada-Light
    NotoSansKannada-Regular
 Family: Noto Sans Myanmar
    NotoSansMyanmar-Bold
    NotoSansMyanmar-Light
    NotoSansMyanmar-Regular
 Family: Noto Sans Oriya
    NotoSansOriya
    NotoSansOriya-Bold
 Family: Noto Sans Syriac
    NotoSansSyriac-Regular
    NotoSansSyriac-Regular_Black
    NotoSansSyriac-Regular_Bold
    NotoSansSyriac-Regular_ExtraBold
    NotoSansSyriac-Regular_ExtraLight
    NotoSansSyriac-Regular_Light
    NotoSansSyriac-Regular_Medium
    NotoSansSyriac-Regular_SemiBold
    NotoSansSyriac-Regular_Thin
 Family: Optima
    Optima-Bold
    Optima-BoldItalic
    Optima-ExtraBlack
    Optima-Italic
    Optima-Regular
 Family: Palatino
    Palatino-Bold
    Palatino-BoldItalic
    Palatino-Italic
    Palatino-Roman
 Family: Papyrus
    Papyrus
    Papyrus-Condensed
 Family: Party LET
    PartyLetPlain
 Family: PingFang HK
    PingFangHK-Light
    PingFangHK-Medium
    PingFangHK-Regular
    PingFangHK-Semibold
    PingFangHK-Thin
    PingFangHK-Ultralight
 Family: PingFang MO
    PingFangMO-Light
    PingFangMO-Medium
    PingFangMO-Regular
    PingFangMO-Semibold
    PingFangMO-Thin
    PingFangMO-Ultralight
 Family: PingFang SC
    PingFangSC-Light
    PingFangSC-Medium
    PingFangSC-Regular
    PingFangSC-Semibold
    PingFangSC-Thin
    PingFangSC-Ultralight
 Family: PingFang TC
    PingFangTC-Light
    PingFangTC-Medium
    PingFangTC-Regular
    PingFangTC-Semibold
    PingFangTC-Thin
    PingFangTC-Ultralight
 Family: Rockwell
    Rockwell-Bold
    Rockwell-BoldItalic
    Rockwell-Italic
    Rockwell-Regular
 Family: STIX Two Math
    STIXTwoMath-Regular
 Family: STIX Two Text
    STIXTwoText
    STIXTwoText-Italic
    STIXTwoText-Italic_Bold-Italic
    STIXTwoText-Italic_Medium-Italic
    STIXTwoText-Italic_SemiBold-Italic
    STIXTwoText_Bold
    STIXTwoText_Medium
    STIXTwoText_SemiBold
 Family: Savoye LET
    SavoyeLetPlain
 Family: Sinhala Sangam MN
    SinhalaSangamMN
    SinhalaSangamMN-Bold
 Family: Snell Roundhand
    SnellRoundhand
    SnellRoundhand-Black
    SnellRoundhand-Bold
 Family: Symbol
    Symbol
 Family: Tamil Sangam MN
    TamilSangamMN
    TamilSangamMN-Bold
 Family: Thonburi
    Thonburi
    Thonburi-Bold
    Thonburi-Light
 Family: Times New Roman
    TimesNewRomanPS-BoldItalicMT
    TimesNewRomanPS-BoldMT
    TimesNewRomanPS-ItalicMT
    TimesNewRomanPSMT
 Family: Trebuchet MS
    Trebuchet-BoldItalic
    TrebuchetMS
    TrebuchetMS-Bold
    TrebuchetMS-Italic
 Family: Verdana
    Verdana
    Verdana-Bold
    Verdana-BoldItalic
    Verdana-Italic
 Family: Zapf Dingbats
    ZapfDingbatsITC
 Family: Zapfino
    Zapfino
 */
