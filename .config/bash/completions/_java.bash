# vim:ft=sh
# @author nate zhou
# @since 2026

_java() {
    # by default java only complete .class files
    local files=(*.java)
    COMPREPLY=($(compgen -W "${files[*]}" -- "${COMP_WORDS[COMP_CWORD]}"))
}
complete -F _java java
