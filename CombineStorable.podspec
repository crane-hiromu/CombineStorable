Pod::Spec.new do |spec|
  spec.name           = "CombineStorable"
  spec.version        = "1.0.0"
  spec.summary        = "Handy Combine extensions on NSObject, including Set<AnyCancellable>."
  spec.homepage       = "https://github.com/crane-hiromu/CombineStorable"
  spec.license        = { :type => 'MIT', :file => 'LICENSE' }
  spec.author         = "h.crane"
  spec.platform       = :ios, "13.0"
  spec.swift_versions = "5.0"
  spec.source         = { :git => "https://github.com/crane-hiromu/CombineStorable.git", :tag => "#{spec.version}" }
  spec.source_files   = "Sources/**/*.{swift}"
end