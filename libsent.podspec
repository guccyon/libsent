Pod::Spec.new do |s|
  s.name             = "libsent"
  s.version          = "4.3.1"
  s.summary          = "static library of libsent."
  s.homepage         = "https://github.com/guccyon/libsent"
  s.license          = 'MIT'
  s.author           = { "Tetsuro Higuchi" => "higuchi.tetsuro[at]gmail.com" }
  s.source           = { :git => "https://github.com/guccyon/libsent.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'src/**/*',
                   'Pod/include/sent/*.{h,c}',
                   'include/**/*.h'
  s.exclude_files = %w[
    esd mic_darwin_coreaudio mic_freebsd mic_linux mic_linux_alsa
    mic_linux_oss mic_o2 mic_sol2 mic_sp mic_sun4 na
    portaudio pulseaudio netaudio
  ].map{|e| "src/adin/adin_#{e}.c" } + ['src/adin/pa']

  s.header_mappings_dir = 'sent'
  s.xcconfig            = {
    'HEADER_SEARCH_PATHS' => '"$(PODS_ROOT)/Headers/Public/include" "$(PODS_ROOT)/Headers/Private/Pod/include"'
  }
  s.libraries = 'z'
end
