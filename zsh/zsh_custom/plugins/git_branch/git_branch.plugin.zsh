function git_branch() {
  branch="$(git branch 2>/dev/null | grep -Po '(?<=\* ).*$')"
  if [ -z "$(git branch 2>/dev/null)" ]; then
    echo ""
  else
    echo "[$branch]"
  fi
}
