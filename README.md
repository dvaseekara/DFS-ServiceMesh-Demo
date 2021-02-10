# Service Mesh Demo at DFS
This is a minimal demo of Service Mesh catered for Discover Financial Services.  The demo is designed to follow the "RedBeard" deck and showcases the simplicity of enabling routing policies using Service Mesh.  This demo can be extended to show RBAC controls, MTLS, and other Service Mesh features but for now it showcases Routing policies, Kiali, and Jaeger.  

RedBeard Deck:  https://docs.google.com/presentation/d/1J3I_UhGScsJgnJxpmOKZwamv8Sf3UmSx9MI_yKg6GQk/edit#slide=id.g38d28c45af_2_14

Login to Cluster:
http://console-openshift-console.apps.cluster-dfs-3370.dfs-3370.sandbox744.opentlc.com 
admin r3dh4t1!

### Login and Setup
```oc login --token=N1oBMcMrB8y9TygpU7PAbXMeGcgtuEjbIOL52edur9s --server=https://api.cluster-dfs-3370.dfs-3370.sandbox744.opentlc.com:6443```
* Show basic Service Mesh components
* Show application components (three services and versioning)
* Show sidecar proxy

### Observability with Kiali and Jaeger
Kiali Route: `echo https://$(oc get route -n user1-smcp kiali -o 'jsonpath={.spec.host}')`

Kiali Route: `kiali-user1-smcp.apps.cluster-dfs-3370.dfs-3370.sandbox744.opentlc.com`

Jaeger Route: `echo https://$(oc get route -n user1-smcp jaeger -o 'jsonpath={.spec.host}')`

Showcase Tracing, REST metrics, and Graphs.

#### Generate Load
```
oc get route user1-smcp
export INGRESS_GATEWAY=istio-ingressgateway-user1-smcp.apps.cluster-dfs-3370.dfs-3370.sandbox744.opentlc.com 
while :; do sleep 0.2; curl http://$INGRESS_GATEWAY &> /dev/null ; done
```

### Routing With Service Mesh
Look at existing SM components:  `oc get istio-io -n user1-tutorial`

Detailed Look at SM components:  `oc describe istio-io -n user1-tutorial`

#### Virtual Service
The Virtual Service specifying the routing rules to apply when the host is addressed. These routing rules can include
   * Routing to specific destinations
   * Matching on a transport type
   * Matching on specific transport attributes such as headers or path

#### Destination Rules
The Destination Rule specifying policies to be applied to the destination such as
   * Load balancing
   * Outlier detection
   * Transport Encryption (TLS)
   * Connection Pools
	   
#### Demonstration of 80-20
Destination Rule: `oc apply -f destination-rule.yml -n user1-tutorial`

Virtual Service 80-20: `oc apply -f virtual-service-80-20.yml -n user1-tutorial`

#### Demonstration of Canary Deployments
Virtual Service Canary-deployment:  `oc apply -f canary-deployment.yml -n user1-tutorial`

curl: `curl -H "user-location: Boston" http://${INGRESS_GATEWAY}/`

Cleanup:  `oc delete virtualservice recommendation -n admin-tutorial`

#### Demonstrate Mirroring
* Not enough time for this.  Just describe it




	



