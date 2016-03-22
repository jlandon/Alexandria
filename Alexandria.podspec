Pod::Spec.new do |s|
  s.name                = "Alexandria"
  s.version             = "1.1.0"
  s.summary             = "Oven Bits' library of useful iOS Swift extensions."
  s.description         = <<-DESC
    The Oven Bits open source library, Alexandria, is one of the new Wonders of the iOS World.
    
    Alexandria provides a library of useful iOS Swift extensions that we have found useful in our 
    iOS app development. We hope you'll find them useful as well.
    DESC
  
  s.homepage            = "https://github.com/ovenbits/Alexandria"
  s.license             = { :type => "MIT", :text => <<-LICENSE
    Copyright (c) 2014-2016 Oven Bits.

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
    LICENSE
  }
  s.author              = {
    "John Daub" => "john.daub@ovenbits.com",
    "Jonathan Landon" => "jonathan.landon@ovenbits.com",
    "Ben Kreeger" => "ben.kreeger@ovenbits.com",
    "Chris Voss" => "chris.voss@ovenbits.com",
    "Steven Schobert" => "steven.schobert@ovenbits.com",
    "Jayson Lane" => "jayson.lane@ovenbits.com",
    "Claire Knight" => "claire.knight@krider.co.uk",
    "Alex Corcoran" => "alex.corcoran@ovenbits.com"
  }
  s.social_media_url    = 'https://twitter.com/ovenbitsmobile'
  s.platform            = :ios, "8.0"
  s.requires_arc        = true
  s.documentation_url   = 'https://ovenbits.github.io/Alexandria'
  s.source              = { :git => "https://github.com/ovenbits/Alexandria.git", :tag => "v#{s.version}" }
  s.frameworks          = *%w(Foundation UIKit)

  s.subspec "Core" do |sp|
    sp.source_files  = *%w(Sources/*.{swift,h,m})
  end

  s.subspec "StoreKit" do |sp|
    sp.source_files = "Sources/StoreKit"
    sp.weak_framework = 'StoreKit'
  end

  s.subspec "ImageEffects" do |sp|
    sp.source_files = "Sources/ImageEffects"
    sp.weak_framework = 'Accelerate'
  end

end
