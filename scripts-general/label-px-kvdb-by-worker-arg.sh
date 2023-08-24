#!/usr/env/bin bash
#
# enter a label fragment found in the node name that designates workers: w, worker, etc.
#
if [ $# -eq 0 ]; then
  echo "Enter a node name fragment to filter by ... e.g., 'w' 'worker' etc. ..."
  return
fi
for node in $(kubectl get nodes -o custom-columns=NAME:.metadata.name | grep $1);
do
  kubectl label nodes ${node} "px/metadata-node=true"
done

