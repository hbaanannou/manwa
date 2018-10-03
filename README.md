# README

$ sudo apt update

$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

$ sudo apt install curl

$ \curl -sSL https://get.rvm.io | bash -s stable --ruby

$ source /home/manwa/.rvm/scripts/rvm

$ rvm -v

$ ruby -v


$ sudo apt install nodejs

$ sudo apt install git


$ gem install rails -v 5.2.0

$ rails -v


$ wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

$ sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"

$ sudo apt install sublime-text



$ sudo apt install postgresql postgresql-contrib libpq-dev pgadmin3

$ systemctl start postgresql

$ systemctl enable postgresql

$ sudo su - postgres

$ psql

$$ ALTER USER postgres WITH PASSWORD 'test123';

$$ CREATE USER manwa WITH PASSWORD 'test123';

$$ ALTER USER manwa WITH SUPERUSER;

$$ \q

$ su - manwa


$ git clone https://github.com/hanyelbanna/manwa.git

$ bundle install

$ rails db:setup

$ rails s