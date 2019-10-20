Pod::Spec.new do |s|
  s.name                = "Alexandria"
  s.version             = "4.1.0"
  s.summary             = "Library of useful iOS Swift extensions."
  s.description         = <<-DESC
    Alexandria provides a library of useful iOS Swift extensions.
    DESC
  
  s.homepage            = "https://github.com/jlandon/Alexandria"
  s.license             = "MIT"
  s.author              = {
    "John Daub" => "hsoi@hsoi.com",
    "Jonathan Landon" => "jlandon@me.com",
    "Ben Kreeger" => "ben.kreeger@icloud.com",
    "Chris Voss" => "chrisvoss@gmail.com",
    "Steven Schobert" => "spschobert@gmail.com",
    "Jayson Lane" => "jaysonlane@gmail.com",
    "Claire Knight" => "claire.knight@krider.co.uk",
    "Alex Corcoran" => "alex.p.corcoran@gmail.com"
  }
  s.platform            = :ios, "8.0"
  s.requires_arc        = true
  s.swift_versions 		= ['5.0', '5.1']
  s.documentation_url   = 'https://jlandon.github.io/Alexandria'
  s.source              = { :git => "https://github.com/jlandon/Alexandria.git", :tag => s.version }
  s.frameworks          = *%w(Foundation UIKit)

  s.subspec "Core" do |sp|
    sp.source_files  = *%w(Sources/Alexandria/*.{swift,h,m})
  end

  s.subspec "StoreKit" do |sp|
    sp.source_files = "Sources/Alexandria/StoreKit"
    sp.weak_framework = 'StoreKit'
  end

  s.subspec "ImageEffects" do |sp|
    sp.source_files = "Sources/Alexandria/ImageEffects"
    sp.weak_framework = 'Accelerate'
  end

end
