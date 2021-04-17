Pod::Spec.new do |s|
s.name         = "Storable"
s.version      = "v1.1.1"
s.summary      = "Handy Combine extensions on NSObject, including Set<AnyCancellable>."
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.homepage     = "https://github.com/crane-hiromu/Storable"
s.author       = { "h.crane" => "h.crane.t@gmail.com" }
s.source       = { :git => "https://github.com/crane-hiromu/Storable.git", :tag => "#{s.version}" }
s.platform     = :ios, "13.0"
s.requires_arc = true
s.source_files  = "Sources/**/*.{swift}"
s.swift_version = "5.0"
end