#
#  Be sure to run `pod spec lint StyleSheet.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.platform     = :ios
  spec.ios.deployment_target     = '9.0'
  spec.name         = "StyleSheet"
  spec.summary      = "Library for specifying view styles."
  spec.requires_arc = true

  spec.version      = "1.0.0"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author       = "Mikhail Muzhev"

  spec.homepage     = "https://github.com/mikhail-muzhev/StyleSheet"

  spec.source       = { :git => "http://mikhail-muzhev/StyleSheet.git", :tag => "#{spec.version}" }

  spec.source_files  = "StyleSheet/**/*.{swift}"

  spec.resources = "StyleSheet/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
  spec.swift_version = "4.2"

end
