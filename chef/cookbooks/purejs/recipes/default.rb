# add the remi repo
yum_repository 'remi' do
  description 'Les RPM de remi pour Enterprise Linux'
  mirrorlist 'http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror'
  gpgkey 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
  action :create
end
#create a users roup
group "users" do
  members ['vagrant','meteor']
end

#Set permissions on the repository
directory '/vagrant' do
  mode '0775'
  recursive true
end
#use git to grab our project

git '/vagrant/DC-Sensors' do
   repository 'https://github.com/SLACNationalAcceleratorLaboratory/DC-Sensors'
   revision 'DC-Sensors-Refresh'
   user 'vagrant'
   group 'users'
   action :checkout
end
#Set permissions on the repository
directory '/vagrant' do
  mode '0775'
  user 'vagrant'
  group 'users'
  recursive true
end
directory '/root' do
  recursive true
  mode '0775'
  user 'root'
  group 'users'
end
git '/vagrant/DC-Sensors/ui/packages' do
  repository 'https://github.com/kahmali/meteor-restivus.git'
  user 'vagrant'
  group 'users'
  action :sync
end

 # execute 'meteor add nimble:restivus' do
 #   cwd '/vagrant/DC-Sensors/ui'
 #   user 'meteor'
 #   group 'users'
 # end
execute 'meteor' do
  cwd '/vagrant/DC-Sensors/ui'
  user 'meteor'
  group 'users'
end
#launch meteor app
#execute 'restivus' do
#  command '/usr/local/bin/meteor add nimble:restivus'
#  cwd '/vagrant/DC-Sensors/ui'
#  action :run
#end
