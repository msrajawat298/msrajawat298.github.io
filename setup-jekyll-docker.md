version: '3'
services:
  ubuntu_container:
    image: ubuntu
    container_name: my_ubuntu_container
    volumes:
      - ${PWD}:/mnt
    tty: true
    stdin_open: true
    command: bash -c "apt-get update && apt-get install -y ruby-full build-essential zlib1g-dev && gem install jekyll bundler && apt-get install -y git && exec bash"


git clone https://github.com/cotes2020/jekyll-theme-chirpy
apt-get update
apt-get install ruby-full build-essential zlib1g-dev
https://jekyllrb.com/docs/installation/ubuntu/



cd /mnt/jekyll-theme-chirpy
~/.gem/ruby/3.0.0/bin/bundle install


https://chat.openai.com/share/73c9d8b8-66fd-4cdb-a2aa-a71d0db921c8q


bundle exec jekyll serve


&& cd /mnt/testing && bundle install && bundle exec jekyll serve --livereload