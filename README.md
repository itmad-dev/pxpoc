# Portworx POC brief procedures
## Design Goals  


- Deployment  
  Always available
  Runs in browser on local host without security  
  Starts automatically upon OS start


Deploy Portworx Enterprise on vSphere with Tanzu - PhotonOS
With the introduction of vSphere with Tanzu, Pure Storage has provided support with vVols for persistent storage.

Since acquiring Portworx in the fall of 2020, the need to extend the current Pure Validated Design to include the Portworx Data Services platform has been in demand.

The instructions found here are for clusters based on PhotonOS.

To deploy a Portworx enabled Tanzu cluster (TKGs)
Enable Workload Management according to VMware Best Practices:VMware vSphere with Tanzu Workflow
To deploy a Portworx Enabled Cluster, open tanzu-cluster/cluster-admin-psp-command.sh and paste the command into your terminal window where you run kubectl commands
Create 2 new VM Classes and assign them to your namespace in the vSphere UI
tkg-control-plane- 4 vCPUs and 4Gi RAM
tkg-workers - 8 vCPUs and 16 or 32Gi RAM
Make sure all pre-requisites are met based on VMware documentation.
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
