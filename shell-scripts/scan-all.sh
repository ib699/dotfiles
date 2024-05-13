ip a | grep inet | awk '/inet / {gsub(/\/.*/, "", $2); print $2}' | xargs -I {} nmap -p 22 {}
