Pod::Spec.new do |s|
  s.name             = "NSString-HYPDate"
  s.version          = "0.1"
  s.summary          = "Output dates or date strings (ISO8601 format) in default string format using only a single line of code."
  s.homepage         = "https://github.com/hyperoslo/NSString-HYPDate"
  s.license          = 'MIT'
  s.author           = { "Hyper AS" => "teknologi@hyper.no" }
  s.source           = { :git => "https://github.com/hyperoslo/NSString-HYPDate.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hyperoslo'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Source/**/*'

  s.dependency 'ISO8601DateFormatter', '~> 0.7'
end
