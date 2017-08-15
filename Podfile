platform :ios, '9.0'
use_frameworks!

def podlist
  pod 'GifHero'
  pod 'Firebase/Core'
  pod 'Firebase/Database'
end

target 'gattaca' do
  podlist

  target 'UnitTests' do
     inherit! :search_paths
     pod 'Firebase'
  end

  target 'UITests' do
     inherit! :search_paths
     pod 'Firebase'
  end
end

