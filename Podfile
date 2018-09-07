platform :ios, '10.0'

target 'freeMarknad' do

  pod 'AFNetworking',      '~> 3.0'
  pod 'Mantle',            '~> 2.0'
  pod 'Masonry',           '~> 1.0'
  pod 'ReactiveCocoa',     '2.1.8'
  pod 'libextobjc',        '~> 0.4'
  pod 'ReactiveViewModel', '0.1.1'
  pod 'UIColor-Utilities', '1.0.1'

  inhibit_all_warnings!

  target 'freeMarknadTests' do
    inherit! :search_paths
    pod 'Specta',      '~> 0.2.1'
    pod 'Expecta',     '~> 0.2.3'
    pod 'OCMock',      '~> 2.2.1'

    inhibit_all_warnings!
  end

  target 'freeMarknadUITests' do
    inherit! :search_paths
  end

end
