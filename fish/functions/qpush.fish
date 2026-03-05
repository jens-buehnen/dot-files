function qpush
    git add .
    if set -q argv[1]
        git commit -m "$argv"
    else
        git commit -m update
    end
    git push
end
