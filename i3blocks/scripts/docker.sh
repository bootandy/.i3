echo -n '🐋 '
#kubectl get pods | grep -Ev '^NAME' | wc -l
docker ps | grep -E 'Up ' | wc -l
