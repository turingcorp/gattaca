platform :ios, '9.0'
use_frameworks!

def podlist
  pod 'GifHero'
  pod 'Firebase/Core'
  pod 'Firebase/Database'
end

target 'gattaca' do
  podlist
end

target 'UnitTests' do
  inherit! :search_paths
  pod 'Firebase'
end
