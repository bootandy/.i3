echo -n '🐋 '
kubectl get pods | grep -Ev '^NAME' | wc -l
