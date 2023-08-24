### Portworx POC brief procedures
#### Pre POC Sessions
- PX Central login  
  central.portworx.com - create account  
- Environment, prerequisites review  
  https://2.13.docs.portworx.com/install-portworx/prerequisites/  
  - Nodes - control plane, workers
  - Kubernetes version  
      
#### PX First Session
- Prepare nodes    
  kvdb labels
  firewall
- As needed: namespaces, secrets  
- PX Operator - create, apply  
- StorageCluster - create apply  
  As needed - firewall, provisioning troubleshooting  
  
Edit tanzu-cluster/tkg-cluster-conf.yaml to use the Storage Classes you have configured and make sure the namespace is accurate and save it to your management station.
Apply the tanzu-cluster/tkg-cluster-conf.yaml file to your namespace to create a cluster
Follow VMware guides to connect to the Tanzu cluster with kubectl command:Connect to Tanzu Cluster
Once cluster is available, open portworx-tanzu/portworx-psp.sh and paste the command into your terminal to grant serviceaccounts in the kube-system namespace permissions to run privileged pods.
To deploy the Portworx Operator into the kube-system namespace, apply portworx-tanzu/tkc-px-operator.yaml
Once the operator is running, apply portworx-tanzu/tkc-px-cluster.yaml, this will deploy the Portworx Storage Cluster
Watch the pods using watch kubectl get pods -n kube-system -l name=portworx
When the pods reach 2/3 running, stop the watch process, or open a second terminal and open portworx-tanzu/portworx-firewall-psp.sh and paste the contents into your active terminal
Once this command is issued, the cluster will finish deploying. This usually takes between 5-10 minutes.
The deployment will use the vsphere-csi driver to configure a Portworx Storage Pool
