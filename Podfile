platform :ios, '10.0'

use_frameworks!
inhibit_all_warnings!

# Shared Pods

def shared_database_pod
    pod 'RealmSwift'
end

def shared_facebook_pod
  pod 'FBSDKLoginKit'
end

def available_pods
    shared_database_pod
    shared_facebook_pod
end

# ====== iOS App =======

target 'FacebookLogin' do
    available_pods
end

target 'FacebookLoginTests' do
    inherit! :complete
end

target 'FacebookLoginUITests' do
    inherit! :complete
    available_pods
end
