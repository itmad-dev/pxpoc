### Portworx POC brief procedures
#### Pre POC Sessions
- PX Central login  
  central.portworx.com - create account  
- Environment, prerequisites review  
  https://3.0.docs.portworx.com/install-portworx/prerequisites/  
  - Nodes - control plane, workers
  - Kubernetes version  
      
#### PX First Session
- Prepare nodes    
  kvdb labels  
  firewall
- Prepare, stage manifests, artifacts  
- As needed: namespaces, secrets  
- PX Operator - create, apply  
- StorageCluster - create apply  
  As needed - firewall, provisioning troubleshooting  
- Sample storage provisioning    
  Storage class(es)  
  PVC(s)  

#### PX Second Session - PX-Central, PX-Backup  
- Prepare, stage manifests, artifacts  
  Specifics: PX-Central version, UI service type  
- As needed: namespaces, secrets  
- Helm - apply  
  As needed - firewall, provisioning troubleshooting  
- PX-Central UI access  
- PX-Central provisioning  
  Add cluster  
  Add cloud credential(s), S3 endpoint(s)  
- PX-Backup provisioning  
  Add cluster  
  Add cloud credential(s), S3 endpoint(s) 
- Test backup(s), restore(s)  
