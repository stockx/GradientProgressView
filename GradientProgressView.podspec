Pod::Spec.new do |s|
  s.name               = "GradientProgressView"
  s.version            = "0.2.2"
  s.summary            = "A simple drop-in progress view with a slight linear vertical gradient written in Swift."
  s.homepage           = "https://github.com/stockx/GradientProgressView"
  s.license            = "MIT"
  s.author             = { "Josh Sklar" => "jrmsklar@gmail.com" }
  s.social_media_url   = "https://instagram.com/jrmsklar"
  s.platform           = :ios
  s.platform           = :ios, "8.2"
  s.source             = { :git => "https://github.com/stockx/GradientProgressView.git", :tag => s.version}
  s.source_files       = "Source/**/*.swift"
end
