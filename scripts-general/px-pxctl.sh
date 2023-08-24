PX_POD=$(kubectl get pods -l name=portworx -n portworx -o jsonpath='{.items[0].metadata.name}')
alias pxctl='kubectl exec $PX_POD -n portworx -- /opt/pwx/bin/pxctl --color'
