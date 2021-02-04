Pod::Spec.new do |s|
  s.name             = 'CITreeView'
  s.version          = '2.0.0'
  s.summary          = 'CITreeView created to implement and maintain that wanted TreeView structures for IOS platforms easy way.'

  s.description      = <<-DESC
CITreeView created to implement and maintain that wanted TreeView structures for IOS platforms easy way. CITreeView offers an infinite treeview structure and is constantly being developed
                       DESC

  s.homepage         = 'https://github.com/cenksk/CITreeView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Cenk Işık' => 'isik.cnk@gmail.com',
                        'takeguchi' => 'takeguchi@kiroru-inc.jp' }
  s.source           = { :git => 'https://github.com/kiroru/CITreeView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = "CITreeViewClasses/*.swift"


end
