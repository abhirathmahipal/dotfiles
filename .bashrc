function most_active_files_git {
     # https://stackoverflow.com/a/7686616/5698202
     git log --pretty=format: --name-only | sort | uniq -c | sort -rg
}

function sort_files_by_size_current_directory {
    ls -lShr
}

function find_main_function {
    grep -r -- 'main[  ]*(\|int main\|__main__\|main\s* ='
}
