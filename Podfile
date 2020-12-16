# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'ADNCeiba'

#use_frameworks!

target 'Presentation' do
  xcodeproj 'Presentation/Presentation.xcodeproj'

  # Pods for Presentation
  pod 'Swinject'

  target 'PresentationTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'PresentationUITests' do
    # Pods for testing
  end
end


#target 'Persistence' do
  
    #xcodeproj 'Persistence/Persistence.xcodeproj'
    
    #pod 'Realm',  :modular_headers => true
    #pod 'RealmSwift',  :modular_headers => true
    #pod 'SQLite.swift'
#end

target 'Domain' do
  
  xcodeproj 'Domain/Domain.xcodeproj'

  # Pods for Domain

  target 'DomainTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
