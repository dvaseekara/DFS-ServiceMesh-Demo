oc login --token=N1oBMcMrB8y9TygpU7PAbXMeGcgtuEjbIOL52edur9s --server=https://api.cluster-dfs-3370.dfs-3370.sandbox744.opentlc.com:6443
export JUPYTERHUB_USER=user1
export INGRESS_GATEWAY=$(oc get route istio-ingressgateway -n $JUPYTERHUB_USER-smcp -o 'jsonpath={.spec.host}')
echo "A load generating script is running in the next step. Ctrl+C to stop"
while :; do sleep 0.2; curl http://${INGRESS_GATEWAY} &> /dev/null ; done

