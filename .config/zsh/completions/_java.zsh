# vim:ft=sh
# @author nate zhou
# @since 2026

_java() {
    # by default java only complete .class files
    local files=(*.java)
    _files "$@"
}
compdef _java java
