STORK_POD=$(kubectl get pods -n portworx -l name=stork -o jsonpath='{.items[0].metadata.name}') &&
kubectl cp -n portworx $STORK_POD:/storkctl/linux/storkctl ./storkctl
sudo mv storkctl /usr/local/bin &&
sudo chmod +x /usr/local/bin/storkctl
