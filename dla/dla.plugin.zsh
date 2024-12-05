#
# Functions
#
info() {
  printf "\e[32m%s\e[0m\n" "${1}"
}

progress() {
  printf "\e[97m%s\e[0m\n" "${1}"
}

warning() {
  printf "\e[33m%s\e[0m\n" "${1}"
}

docker_cleanup() {
  info "Removing docker containers, volumes, images and build cache..."
  docker stop $(docker ps -a -q) > /dev/null 2>&1
  docker rm -f -v $(docker ps -a -q) > /dev/null 2>&1
  docker volume prune -a -f > /dev/null 2>&1
  docker image rm -f $(docker images -q -a) > /dev/null 2>&1
  docker builder prune -a -f > /dev/null 2>&1
  progress "Done."
}

docker_list_all() {
  warning "Containers:"
  docker container ls -a
  warning "Volumes:"
  docker volume ls
  warning "Images:"
  docker images -a
  warning "Disk usage:"
  docker system df
}

#
# Aliases
#
alias dclp='docker_cleanup'
alias dla='docker_list_all'
