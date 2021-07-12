ssh kube-node1
pwd
history
exit
sudo pat update
sudo apt update
sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg     lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
clear
su ls -l /etc/apt/sources.list.d/
sudo ls -l /etc/apt/sources.list.d/
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
systemctl status docker
docker ps
sudo docker ps
sudo usermod -aG docker vagrant
docker ps
id
history
exit
docker ps
docker search wordpress
docker pull mysql:8.7
docker pull mysql:5.7
docker run -d --name wpdb -e MYSQL_DATABASE=wpdb -e MYSQL_USER=wp -e MYSQL_PASSWORD=wppass mysql:5.7
docker ps
docker container prune 
docker run -d --name wpdb -e MYSQL_ROOT_PASSWORD=toor -e MYSQL_DATABASE=wpdb -e MYSQL_USER=wp -e MYSQL_PASSWORD=wppass mysql:5.7
docker ps
docker pull wordpress
history
docker images
docker run -d --name wp --link wpdb:wpdb -e WORDPRESS_DB_HOST=wpdb -e WORDPRESS_DB_USER=wp -e WORDPRESS_DB_PASSWORD=wppass -e WORDPRESS_DB_NAME=wpdb wordpress
docker ps
docker exec -it wp bash
docker inspect wp
docker rm -f wp
docker run -d -p 8080:80 --name wp --link wpdb:wpdb -e WORDPRESS_DB_HOST=wpdb -e WORDPRESS_DB_USER=wp -e WORDPRESS_DB_PASSWORD=wppass -e WORDPRESS_DB_NAME=wpdb wordpress
docker ps
docker volume create wpdb
docker volume ls
exit
ssh kube-node1
clear
vagrant ssh kube-node1
ssh kube-node1
exit
clear
history
```bash
vagrant@kube-control1:~$ curl https://docs.projectcalico.org/manifests/calico.yaml -O
vagrant@kube-control1:~$ kubectl apply -f calico.yaml
vagrant@kube-control1:~$ kubectl get nodes
NAME            STATUS     ROLES    AGE   VERSION
kube-control1   NotReady   master   18m   v1.18.18
docker ps
clear
curl https://docs.projectcalico.org/manifests/calico.yaml -O
kubectl apply -f calico.yaml
kubectl get nodes
ssh kube-node1
ssh kube-node2
docker images
docker image prune 
docker images
dockr ps
docker ps -a
docker container prune 
docker image prune 
docker images
docker rmi -a
docker rmi `docker images -q`
docker images 
sudo apt-get update
lsmod | grep br_netfilter
sudo ls /run/containerd/
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
apt-cache madison kubeadm
sudo apt install kubectl=1.18.18-00 kubeadm=1.18.18-00 kubelet=1.18.18-00
sudo apt-mark hold kubelet kubeadm kubectl
kubeadm version
kubectl version
kubelet --version
kubeadm config images pull
docker image ls
sudo kubeadm init --control-plane-endpoint 192.168.200.11 --pod-network-cidr 192.168.0.0/16 --apiserver-advertise-address 192.168.200.11
sudo kubeadm init --control-plane-endpoint 192.168.100.11 --pod-network-cidr 192.168.0.0/16 --apiserver-advertise-address 192.168.100.11
sudo kubeadm reset
systemctl restart docker
sudo systemctl restart docker
systemctl status docker
docker images
sudo kubeadm init --control-plane-endpoint 192.168.100.11 --pod-network-cidr 192.168.0.0/16 --apiserver-advertise-address 192.168.100.11
clear
mkdir $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
mkdir ~/.kube/
ls
cd $HOME
PWD
pwd
ls
ls .kube/
ls
cd .kube/
ls -l
history
clear
ip a p
ip a s
exit
clear
kubectl create deployment --help
clear
exit
clear
kubectl api-versions 
clear
kubectl create deployment myapp --image=ghcr.io/c1t1d0s7/go-myweb
kubetctl get deployment
kubectl get deployment
kubectl get replicasets
kubectl get pod
kubectl get pods
kubectl get all
kubectl expose deployment myapp --port=80 --protocol=TCP --target-port=8080 --name mysqpp-svc --type=LoadBalancer
kubectl get services
curl 192.168.100.21:32274
clear
kubectl scale deployment myapp --replicas=3
kubectl get pods
kubectl delete deployment myapp
kubectl get all
kubectl delete service mysqpp-svc
kubectl get all
sudo apt-get install bash-completion
source /usr/share/bash-completion/bash_completion 
echo 'source <(kubectl completion bash)' >> ~/.bashrc
kubectl completion bash > /etc/bash_completion.d/kubectl
sudo kubectl completion bash > /etc/bash_completion.d/kubectl
sudo -i
sudo systemctl status bash
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc
clear
vi ~/.vimrc
vi a.yml
kubectl api-resources 
kubectl api-versions 
kubectl api-resources 
clear
kubectl api-versions
kubectl api-resources 
kubectl api-resources |grep configmaps
kubectl api-resources |grep endpoints
kubectl api-resources |grep namespaces
kubectl api-resources |grep limitranges
kubectl api-resources |grep nodes
kubectl api-resources |grep persistentvolumeclaims
kubectl api-resources |grep persistentvolumes
kubectl api-resources |grep pods
kubectl api-resources |grep replicationcontrollers
kubectl api-resources |grep resourcequotas
kubectl api-resources |grep secrets
kubectl api-resources |grep serviceaccounts
kubectl api-resources |grep services
kubectl api-resources |grep daemonsets
kubectl api-resources |grep deployments
kubectl api-resources |grep replicasets
kubectl api-resources |grep statefulsets
clear
kubectl api-resources |grep statefulsets
kubectl api-resources |grep horizontalpodautoscalers
kubectl api-resources |grep cronjobs
kubectl api-resources |grep jobs
kubectl api-resources |grep -w certificatesigningrequests
kubectl api-resources |grep -w ingresses
kubectl api-resources |grep -w clusterrolebindings
kubectl api-resources |grep -w clusterroles
kubectl api-resources |grep -w rolebindings
kubectl api-resources |grep -w roles
kubectl api-resources |grep -w storageclasses
clear
kubectl explain pod
kubectl explain pod.metadata
clear
kubectl explain pod.spec
kubectl explain pod.kind
kubectl explain pod.spec.containers
kubectl explaiin pod.pec.containers.name
kubectl explain pod.pec.containers.name
kubectl explain pod.spec.containers.name
kubectl explain pod.spec.containers.name --recursive 
clear
kubectl explain pod.spec
kubectl explain pod.spec.containers.ports
clear
kubectl --help
kubectl pods -o yml
kubectl pods -o yaml
kubectl get pods -o yaml
ls
cat calico.yaml 
clear
ls
vi myapp-pod.yaml
kubectl create -f myapp-pod.yaml 
kubectl get pods
kubectl get pods myapp-pod -o yaml
kubectl get pods myapp-pod
kubectl describe pods myapp-pod
kubectl logs myapp-pod
kubectl port-forward myapp-pod 8080:8080
ps -auf
kill -9 303184
ps -auf
clear
curl http://localhost:8080
kubectl port-forward myapp-pod 8080:8080
curl http://localhost:8080
kubectl port-forward myapp-pod 8080:8080
curl localhost:8080
kubectl port-forward myapp-pod 8080:8080
curl http://localhost:8080
curl http://localhost:80
cat myapp-pod.yaml 
curl http://localhost:8080
kubectl port-forward myapp-pod 8080:8080
kubectl logs myapp-pod
clear
vi myapp-pod.yaml 
cp myapp-pod.yaml myapp-pod-label.yaml
vi myapp-pod.yaml 
kubectl create -f myapp-pod-label.yaml 
vi myapp-pod
vi myapp-pod-la
vi myapp-pod-label.yaml 
kubectl create -f myapp-pod-label.yaml 
kubectl get pods --show-labels
kubectl get pods -L env,tier
kubectl get pods myapp-pod-label -o yaml
clear
kubectl label pods myapp-pod env=dev
kubectl label pods myapp-pod-label env=debug
kubectl label pods myapp-pod-label env=debug --overwrite 
kubectl get pods -L env,tier
kubectl get pods --show-labels -l '!tier;
'
kubectl get pods --show-labels -l '!tier'
kubectl get pods --show-labels -l tier
kubectl get pods --show-labels -l env=debug
kubectl get pods --show-labels -l env=dev
kubectl get pods --show-labels -l env!=dev
kubectl get pods --show-labels -l '!debug'
kubectl get pods --show-labels -l 'env!=debug'
kubectl get pods --show-labels -l 'env in (debug,dev)'
clear
kubectl annotate pods myapp-pod devops-team/developer="John Smith"
kubectl describe pod myapp-pod
kubectl get pods myapp-pod -o yaml
kubectl get pods myapp-pod -o yaml | grep -a 5 annotations
kubectl get pods myapp-pod -o yaml | grep -a 5 annotation
kubectl get pods myapp-pod -o yaml | grep annotation
kubectl get pods myapp-pod -o yaml | grep -a10 annotation
kubectl get pods myapp-pod -o yaml | grep -a5 annotation
hitory
history
clear
kubectl api-resources |grep namespace
kubectl api-resources 
clear
kubectl get pods
kubectl delete pod myapp-pod myapp-pod-label.yaml 
kubectl delete pod myapp-pod-label
kubectl get pods
kubectl get -A
kubectl get --all-namespaces 
clear
ls
pwd
mkdir c3
mv myapp-pod.yaml myapp-pod-label.yaml c3
ls
mkdir testEx
cd testEx/
vi http-pod.yaml
kubectl create -f http-pod.yaml 
vi http-pod.yaml 
mv http-pod.yaml myweb-pod.yaml
vi myweb-pod.yaml 
kubectl create -f myweb-pod.yaml 
vi myweb-pod.yaml 
cat myweb-pod.yaml
vi myweb-pod.yaml 
kubectl create -f myweb-pod.yaml 
vi myweb-pod.yaml 
sudo kubectl create -f myweb-pod.yaml 
kubectl get pods
vi myweb-pod.yaml 
kubectl create -f myweb-pod.yaml 
vi myweb-pod.yaml 
kubectl create -f myweb-pod.yaml 
vi myweb-pod.yaml 
kubectl create -f myweb-pod.yaml 
vi myweb-pod.yaml 
kubectl create -f myweb-pod.yaml 
vi myweb-pod.yaml 
kubectl create -f myweb-pod.yaml 
vi myweb-pod.yaml 
kubectl create -f myweb-pod.yaml 
kubectl get pods
cat myweb-pod.yaml 
kubectl port-forward myweb-pod 8080:80
kubectl logs myweb-pod 
cat myweb-pod.yaml 
kubectl delete myweb-pod.yaml 
kubectl delete myweb-pod
kubectl delete pod myweb-pod 
exit
curl http://localhost:8080
curl localhost:8080
kubeadm token list
kubeadm token create
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'
ssh kube-node3
kubectl get nodes
exit
pwd
ls
cd c4
kubectl delete myapp-rc-9gsjq
kubectl delete po myapp-rc-9gsjq
kubectl describe rc myapp-rc
kubectl get pods --show-labels 
kubectl label po myapp-rc-gm5hh env=dev
kubectl get pods --show-labels 
kubectl label pod myapp-rc-gm5hh app=test --overwrite 
kubectl label pod myapp-rc-gm5hh app=myapp-rc --overwrite 
kubectl scale rc myapp-rc --replicas=4
kubectl get pods
kubectl describe rc myapp-rc
kubectl edit rc myapp-rc 
kubectl get pods
kubectl get rc
kubectl get pods --show-labes
kubectl get pods --show-labels 
clear
kubectl get rc
kubectl delete rc myapp-rc 
kubectl get rc
kubectl get pods
clear
kubectl get pods
clear
kubectl get pods
exit
clear
ls
mkdir c4
cd c4
vi myapp-rc.yaml
kubectl create -f myapp-rc.yaml 
vi myapp-rc.yaml 
kubectl create -f myapp-rc.yaml 
kubectl get rc,po
kubectl get rc,po -o -wide
kubectl get rc,po -o
kubectl get rc,po -o wide --show-labels
kubectl describe replicationcontrollers myapp-rc 
kubectl describe replicationcontrollers myapp-rc --watch
watch -n1 -d kubectl describe replicationcontrollers myapp-rc
watch -n1 -d kubectl pods
watch -n1 -d kubectl get pods
watch -n1 -d kubectl get pods --show-labels 
clear
ls
vi myapp-rs.yaml
kubectl create -f myapp-rs.yaml 
exit
clear
kubectl get pods
ls
cd c4
kubectl create -f myapp-rs.yaml 
vi myapp-rs.yaml 
kubectl create -f myapp-rs.yaml 
vi myapp-rs.yaml 
kubectl create -f myapp-rs.yaml 
vi myapp-rs.yaml 
kubectl create -f myapp-rs.yaml 
vi myapp-rs.yaml 
kubectl create -f myapp-rs.yaml 
kubectl get rs,po
kubectl get rs,po -o wide --show-labels 
kubectl label pod myapp-rs app=myapp-rs
kubectl delete pod myapp-rs-nccdx
kubectl get rs,po -o wide --show-labels 
kubectl label pod myapp-rs-17889 app=myapp-rs --overwrite 
kubectl get rs
kubectl get rs,po -o wide --show-labels 
kubectl label pod myapp-rs-17889 app=myapp-rs --overwrite 
kubectl label pod myapp-rs-68h8c app=myapp-rs --overwrite 
kubectl get rs,po -o wide --show-labels 
kubectl label pod myapp-rs-68h8c app=myapp-rs-exp env=test --overwrite 
kubectl get rs,po -o wide --show-labels 
vi myapp-r
vi myapp-rs.yaml 
kubectl delete rs myapp-rs
kubectl get rs,po
kubeclt get nods
kubeclt get nodes
kubectl get nodes 
kubectl get nodes  -o wide
kubectl get -a
kubectl get -A
kubectl get --all-namespaces 
clear
sudo 
kubectl get pods
kubeadm version
kubectl versino
kubectl version
kubelet --version
clear
exit
clear
cd c4
ls
kubectl myapp-rs.yaml 
kubectl create -f myapp-rs.yaml 
kubectl get rs
kubectl get po
kubectl delete po -all
kubectl delete po --all
clear
exit
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ls
cd c4
ls
kubectl get nodes
kubectl get all
cd ..
mkdir d621
cd d621/
vi mysapp-svc.yaml
mv mysapp-svc.yaml myapp-svc.yaml
kubectl create -f myapp-svc.yaml 
kubectl get service
vi myapp-rs.yaml
kubectl create -f myapp-rs.yaml 
vi myapp-rs.yaml 
kubectl create -f myapp-rs.yaml 
vi myapp-rs.yaml 
kubectl create -f myapp-rs.yaml 
vi myapp-rs.yaml 
kubectl create -f myapp-rs.yaml 
kubectl get pods
kubectl get pods -o wide
kubectl get endpoints myapp-svc
kubectl run nettool -it --image=ghcr.io/c1t1d0s7/network-mulitoll --rm bash
kubectl run nettool -it --image=ghcr.io/c1t1d0s7/network-mulitool --rm bash
kubectl get pods
kubectl delete pod nettool
kubectl run nettool -it --image=ghcr.io/c1t1d0s7/network-mulitool --rm bash
kubectl delete pod nettool
kubectl run nettool -it --image=ghcr.io/c1t1d0s7/network-multitool --rm bash
kubectl get pods -o wide
curl http://192.168.9.73
kubectl get service
curl http://10.110.129.231
kubectl run nettool -it --image=ghcr.io/c1t1d0s7/network-multitool --rm bash
kubectl get endpoints myapp-svc 
vi myapp-rs.yaml 
vi myapp-svc.yaml 
vi myapp-rs.yaml 
kubectl get endpoints myapp-svc 
vi myapp-rs.yaml 
kubectl get all -o wide
kubectl delete myapp-rs
kubectl delete rs myapp-rs
kubectl get rs,po,srv
kubectl get rs,po,src -o wide
kubectl get rs,po,svc -o wide
vi myapp-rs.yaml 
kubectl create -f myapp-rs.yaml 
kubectl get all
kubectl get endpoints myapp-svc 
kubectl run nettool -it --image=ghcr.io/c1t1d0s7/network-multitool --rm bash
vi myapp-svc-ses-aff.yaml
kubectl create -f myapp-svc-ses-aff.yaml 
vi myapp-svc-ses-aff.yaml 
kubectl create -f myapp-svc-ses-aff.yaml 
kubectl get src myapp-svc-ses-aff
kubectl get svc myapp-svc-ses-aff
kubectl get endpoints myapp-svc-ses
kubectl get endpoints myapp-svc-ses-aff 
kubectl run nettool -it --image=ghcr.io/c1t1d0s7/network-multitool --rm bash
vi myapp-svc-multiport.yaml
vi myapp-rs-named-port.yaml
vi myapp-svc-named-port.yaml
kubectl create -f myapp-rs-named-port.yaml -f myapp-svc-named-port.yaml 
vi myapp-rs-named-port.yaml 
kubectl create -f myapp-rs-named-port.yam
ls
kubectl create -f myapp-rs-named-port.yaml
kubeclt get rs myapp-rs-named-port.yaml 
kubeclt get rs myapp-rs-named-port
kubeclt get rs myapp-rs-namedport
ls
kubeclt get rs myapp-rs-named-port
kubectl get rs myapp-rs-named-port
kubectl get replicset.apps myapp-rs-named-port
kubectl get replicsets.apps myapp-rs-named-port
kubectl get all
kubectl get replicasets.apps myapp-rs-namedport
kubectl get endpoints myapp-svc-namedport 
kubectl get pods -o wide -l app=myapp-rs-namedport
kubectl run nettool -it --image=ghcr.io/c1t1d0s7/network-multitool --rm bash
kubectl get all -n kube-system -l k8s-app=kube-dns
kubectl get all -n kube-system -l k8s-app=kube-dns -o wide
kubectl delete replicasets.apps,svc --all
kubectl get all
kubectl delete rs
kubectl delete rs --all
kubectl delete replicasets myapp-rs myapp-rs-namedport
kubectl delete rs myapp-rs myapp-rs-namedport
kubectl delete rs -all
kubectl delete rs --all
kubectl get all
kubectl create -f myapp-rs.yaml 
clear
kubectl get rs
vi myapp-svc-np.yaml
kubectl create -f myapp-svc-np.yaml 
kubectl get service myapp-svc-np
kubectl get endpoints myapp-svc-np
kubectl get nodes -o wide
curl http://192.168.100.21:31111
curl http://192.168.100.22:31111
curl http://192.168.100.23:31111
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.10.2/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.10.2/manifests/metallb.yaml
vi metallb-config.yaml
kubectl create -f metallb-config.yaml 
kubectl get rs,po
kubectl get svc myapp-svc-lb
clear
vi myapp-svc-lb.yaml
kubectl create -f myapp-svc-lb.yaml 
kubectl get service myapp-svc-lb 
curl http://192.168.100.200
vi myapp-svc-extname.yaml
kubectl create -f myapp-svc-extname.yaml 
kubectl get svc myapp-svc-extname
kubectl run nettool -it --image=ghcr.io/c1t1d0s7/network-multitool --rm bash
kubectl get svc
ls
cat metallb-config.yaml 
kubectl delete rs,svc -all
kubectl delete rs,svc --all
kubectl get all
clear
kubectl https://github.com/kubernetes/ingress-nginx/blob/master/deploy/static/provider/baremetal/deploy.yaml
kubectl create -f https://github.com/kubernetes/ingress-nginx/blob/master/deploy/static/provider/baremetal/deploy.yaml
kubectl apply -f https://github.com/kubernetes/ingress-nginx/blob/master/deploy/static/provider/baremetal/deploy.yaml
kubectl apply -f https://github.com/kubernetes/ingress-nginx/blob/388fa0185c719bbe7148bfb673b2fffb8b95b3b2/deploy/static/provider/baremetal/deploy.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml
kubectl get all
kubectl get all -n ingress-nginx
vi myapp-ing.yaml
vi myapp-ing.yaml 
clear
kubectl create -f myapp-rs.yaml -f myapp-svc-np.yaml 
kubectl create -f myapp-ing.yaml
vi myapp-ing.yaml 
kubectl create -f myapp-ing.yaml
kubectl get ingresses.networking.k8s.io 
kubectl get all
kubectl get ingresses.networking.k8s.io 
kubectl create -f myapp-ing.yaml
vi myapp-ing.yaml
kubectl create -f myapp-ing.yaml
kubectl get all -n ingress-nginx
kubectl apply -f Ingress nginx[https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml](https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml)
kubectl apply -f Ingress nginx[https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml](https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml
kubectl apply -f Ingress nginxhttps://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml
kubeclt get all -n ingress-nginx
kubectl get all -n ingress-nginx
kubectl delete all
kubectl delete --all
kubectl delete ingresses.networking.k8s.io --all
kubectl get all -n ingress-nginx
kubectl delete po,svc,rs,deployment,job --all
kubectl get all -n ingress-nginx
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml
kubectl get pods -n ingress-nginx   -l app.kubernetes.io/name=ingress-nginx --watch
kubectl get all -n ingress-nginx
kubectl get pods -n ingress-nginx \   -l app.kubernetes.io/name=ingress-nginx --watch 
kubectl krew install ingress-nginx
sudo kubectl krew install ingress-nginx
kubectl ingress-nginx --help
sudo apt-get install  krew
kubectl krew install ingress-nginx
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
kubectl krew install ingress-nginx
kubectl ingress-nginx --help
kubectl get all -n ingress-nginx
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml 
kubectl get pods -n ingress-nginx \   -l app.kubernetes.io/name=ingress-nginx --watch 
kubectl get pods -n ingress-nginx
$ kubectl ingress-nginx backends -n ingress-nginx
[
kubectl ingress-nginx backends -n ingress-nginx
kubectl ingress-nginx certs -n ingress-nginx --host testaddr.local
ls
cd -
ls
curl https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml
ls
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml
kubectl get all -n ingress-nginx
ls
ls -al
clear
exit
clear
kubectl get --all
kubectl get all
kubectl get nodees
kubectl get nodes
kubectl get po
kubectl get po -all
kubectl get svc 
kubectl get kubectl get all -n ingress-nginx
kubectl get all -n ingress-nginx
kubectl get all -n ingress-nginx --watch
kubectl get pods
kubectl get pods all
kubectl get pods -all
kubectl get pods --all
kubectl edit services -n ingress-nginx ingress-nginx-controller
kubectl get svc -n ingress-nginx
ls
cd d621/
ls
kubectl create -f myapp-rs.yaml -f myapp-svc-np.yaml 
kubectl create -f myapp-ing.yaml 
kubectl delete -f myapp-ing.yaml 
kubectl create -f myapp-ing.yaml 
kubectl get po,svc
clear
kubectl get ingress.networkingk8s.io
kubectl create -f myapp-ing.yaml
sudo kubectl create -f myapp-ing.yaml
kubectl get all -n ingress-nginx
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml
kubectl get all -n ingress-nginx
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml
kubectl get all -n ingress-nginx
vagrant@kube-control1:~/d621$ vi myapp-ing.yaml
history
history | grep -w edit
kubectl edit services -n ingress-nginx ingress-nginx-controller
kubectl get all -n ingress-nginx
ls
kubectl create -f myapp-ing.yaml 
kubectl get ingresses.networking.k8s.io
kubectl describe  ingresses.networking.k8s.io
kubectl edit services -n ingress-nginx ingress-nginx-controller
curl --resolve myapp.example.com:80:192.168.100.21
curl --resolve myapp.example.com:80
curl --resolve myapp.example.com:80:192.168.100.21
kubectl describe  ingresses.networking.k8s.io
kubectl get ingresses.networking.k8s.io
kubectl edit services -n ingress-nginx ingress-nginx-controller
curlmyapp.example.com:80
curl myapp.example.com:80
curl 192.168.100.21
kubectl get po,svc --all
kubectl get po,svc all
kubectl 
curl myapp.example.com:80
curl myapp.example.com:31111
curl myapp.example.com
kubectl get ingress.networking.k8s.io
kubectl describe ingress.networking.k8s.io
curl --resolve myapp.exmaple.com:80:192.168.100.21
kubectl get ingress --all-namespaces 
kubectl get --all -o wide
kubectl get all -o wide
kubectl get --all-namespaces -o wide
kubectl get pod --all-namespaces -o wide
curl --resolve myapp.example.com:80:192.168.100.21 http:///myapp.example.com/\?detail\=header
vi myapp-ing-multi-paths.yaml
kubectl create -f myapp-ing-multi-paths.yaml
cat myapp-ing-multi-paths.yaml
vi myapp-ing-multi-paths.yaml
kubectl create -f myapp-ing-multi-paths.yaml
kubectl describe ingresses.networking.k8s.io myapp-ing-mpath
vi myapp-ing-multi-hosts.yaml
kubectl create -f myapp-ing-multi-hosts.yaml 
kubectl describe ingresses.networking.k8s.io myapp-ing-mhost
cat myapp-ing-multi-hosts.yaml 
kubectl create -f myapp-ing-multi-hosts.yaml 
vi  myapp-ing-multi-hosts.yaml 
kubectl create -f myapp-ing-multi-hosts.yaml 
kubectl describe ingresses.networking.k8s.io myapp-ing-mhost
history | grep curl --resolve
history | grep resolve
kubectl get ingresses.networking.k8s.io 
curl --resolve web1.example.com:80:192.168.100.21 http:///web1.example.com/\?detail\=header
curl --resolve myapp.example.com/web1:80:192.168.100.21 http:///web1.example.com/\?detail\=header
curl --resolve myapp.example.com/web1:80:192.168.100.21 http:///myapp.example.com/\?detail\=header
curl --resolve myapp.example.com/web1:80:192.168.100.21 http://myapp.example.com/webl
curl --resolve web1.example.com:80:192.168.100.21 http://myapp.example.com/webl
curl --resolve myapp.example.com:80:192.168.100.21 http://myapp.example.com/webl
curl --resolve myapp.example.com:80:192.168.100.21 http://myapp.example.com/webl/\?detail\=header
curl --resolve myapp.example.com:80:192.168.100.21 http://myapp.example.com/web2/\?detail\=header
curl --resolve myapp.example.com:80:192.168.100.21 http://myapp.example.com/web1/\?detail\=header
kubectl delete ingresses.networking.k8s.io --all
kubectl delete replicasets.apps,svc --all
cd ..
mkdir volume
ls
cd volume/
ls
clear
vi myapp-rs-emptydir.yaml
vi myapp-emptydir.yaml
ls
cat myapp-emptydir.yaml 
mv myapp-emptydir.yaml myapp-svc-emptydir.yaml
ls
kubectl create -f myapp-rs-emptydir.yaml -f myapp-svc-emptydir.yaml 
vi myapp-rs-emptydir.yaml 
kubectl create -f  myapp-rs-emptydir.yaml 
vi myapp-rs-emptydir.yaml 
kubectl create -f  myapp-rs-emptydir.yaml 
vi myapp-rs-emptydir.yaml 
kubectl create -f  myapp-rs-emptydir.yaml 
vi myapp-rs-emptydir.yaml 
kubectl create -f  myapp-rs-emptydir.yaml 
ls
kubectl get rs
kubectl get pods
kubectl get pods --watch
kubectl delete -f myapp-rs-emptydir.yaml -f myapp-svc-emptydir.yaml 
vi myapp-rs-emptydir.yaml 
kubectl create -f myapp-rs-emptydir.yaml -f myapp-svc-emptydir.yaml 
kubectl get rs
kubectl get pods
kubectl get svc myapp-svc-fortune 
kubectl get all
kubectl get pods
kubectl get svc myapp-svc-fortune 
clear
kubectl exec myapp-rs-fortune-tt297 -c web-server -- cat /usr/share/nginx/html/index.html
kubectl exec myapp-rs-fortune-tt297 -c html-generator -- cat /var/htdocs/index.html
clear
history
kubectl get svc myapp-svc-fortune 
kubectl get all
clear
curl http://10.96.116.239
clear
kubectl exec myapp-rs-fortune-tt297 -c web-server -- cat /usr/share/nginx/html/index.html
kubectl exec myapp-rs-fortune-tt297 -c html-generator -- cat /var/htdocs/index.html
kubectl delete -f myapp-rs-emptydir.yaml -f myapp-svc-emptydir.yaml 
vi myapp-rs-emptydir.yaml 
kubectl create -f myapp-rs-emptydir.yaml -f myapp-svc-emptydir.yaml 
kubectl svc myapp-svc-emptydir.yaml 
kubectl svc myapp-svc-emptydir
kubectl svc myapp-fortune
history
kubectl get svc myapp-svc-fortune
kubectl get all
kubectl exec myapp-rs-fortune-qzvsd -c web-server -- cat /usr/sharelngiinx/html/index.html
kubectl exec myapp-rs-fortune-qzvsd -c web-server -- cat /usr/share/ngiinx/html/index.html
kubectl exec myapp-rs-fortune-qzvsd -c web-server -- cat /usr/share/nginx/html/index.html
vi myapp-pod-git.yaml
kubectl create -f myapp-pod-git.yaml 
vi myapp-pod-git.yaml
kubectl create -f myapp-pod-git.yaml 
vi myapp-pod-git.yaml
kubectl create -f myapp-pod-git.yaml 
vi myapp-pod-git.yaml
kubectl create -f myapp-pod-git.yaml 
kubectl get pods --watch
kubectl exec myapp-pod-git --ls -l /repo
kubectl exec myapp-pod-git -- ls -l /repo
ls
clear
kubectl delete -f myapp-rs-emptydir.yaml -f myapp-svc-emptydir.yaml -f myapp-pod-git.yaml 
hitory
history
history | grep curl
clear
kubectl get all
ls
cd ..
ls
cd d621
ls
kubectl create -f myapp-rs.yaml -f myapp-svc-np.yaml 
kubectl create -f myapp-ing.yaml 
kubectl get ingresses.networking.k8s.io 
kubectl describe ingresses.networking.k8s.io 
ls
cat myapp-rs.yaml 
cat myapp-svc-np.yaml 
clear
kubectl get ingresses.working.k8s.io
kubectl get all
ls
kubectl create -f myapp-ing.yaml 
kubectl get ingresses.networking.k8s.io 
kubectl get describe ingresses.networking.k8s.io myapp-ing
kubectl describe ingresses.networking.k8s.io myapp-ing
curl --resolve myapp.exmaple.com:80:192.168.100.21 http://myapp.example.com/\?detail\=header
curl --resolve myapp.exmaple.com:80:192.168.100.21
curl --resolve myapp.exmaple.com:80:192.168.100.21 http://myapp.exmaple.com/\?detail\=header
curl --resolve myapp.exmaple.com:80:192.168.100.21 http://myapp.exmaple.com/₩?detail₩=header
curl 192.168.119.159:8080
curl --resolve myapp.exmaple.com:80:192.168.100.21 http://myapp.exmaple.com
kubectl get all
kubectl get ingress
curl 192.168.100.21:80
kubectl edit services -n ingress-nginx ingress-nginx-controller
kubectl edit ingresses.networking.k8s.io 
kubectl get ingress
kubectl delete -f myapp-ing.yaml 
kubectl create -f myapp-ing.yaml 
kubectl get ingress
kubectl describe ingress
curl --resolve myapp.exmaple.com:80:192.168.100.21 http://myapp.exmaple.com
kubectl get ingress
kubectl edit services -n ingress-nginx ingress-nginx-controller
kubectl edit ingresses.networking.k8s.io 
cat myapp-rs.yaml 
cat myapp-svc-np.yaml 
clear
kubectl get ingress
kubectl describe ingress
curl --resolve myapp.example.com:80:192.168.100.21 http://myapp.example.com/₩?detail₩=header
curl --resolve myapp.example.com:80:192.168.100.21 http://myapp.example.com/\?detail\=header
curl 192.168.100.21:80
curl --resolve myapp.example.com:80:192.168.100.21 http://myapp.example.com/\?detail\=header
curl --resolve myapp.example.com:80:192.168.100.21 http://myapp.example.com/
curl http://192.168.100.21:80
curl http://192.168.100.21
curl --resolve myapp.example.com:80:192.168.100.21 http://myapp.example.com/
curl http://192.168.100.21
kubectl get ingress
curl httpd://192.168.100.21:80
curl http://192.168.100.21:80
curl http://192.168.100.21
curl 192.168.100.21:80
curl httpd://myapp.example.com
curl http://myapp.example.com
kubectl describe ingress
curl 192.168.119.159:8080
curl myapp-svc-np:80
kubectl get svc
curl 10.102.14.16
kubectl run nettool -it --image=ghcr.io/c1t1d0s7/network-multitool --rm bash
history
kubectl describe ingress
kubectl describe svc myapp-svc-np
kubectl get svc -n ingress-nginx 
kubectl get deployments.apps svc -n ingress-nginx 
kubectl describe svc -n ingress-nginx 
vi myapp-svc-np.yaml 
kubectl get ingress
kubectl describe ingress
kubectl get pods -o wide
kubectl get svc
kubectl describe myapp-svc-np
kubectl describe svc myapp-svc-np
kubectl describe ingress
vi myapp-svc-np.yaml 
kubectl delete all
kubectl delete --all
kubectl get all
kubectl svc,rs delete 
kubectl delete svc,rs all
kubectl delete svc,rs --all
kubectl get all
kubectl delete ingress
kubectl delete ingress my-ing
kubectl delete --all-namespaces 
kubectl delete --all -namespaces 
kubectl delete --all -n ingress-nginx 
kubectl delete all -n ingress-nginx 
kubectl 
vi myapp-svc-np.yaml 
kubectl create -f myapp-rs.yaml -f myapp-svc-np.yaml 
kubectl get ingress
curl --resolve myapp.example.com:80:192.168.100.21 http://myapp.example.com/\?detail\=header
cat myapp-svc-np.yaml 
clear
kubectl explain pod.spec.livenessProbe
kubectl explain pod.spe
kubectl explain pod.spec
clear
kubectl explain pod.spec.container

kubectl explain pod.spec.containers
kubectl explain pod.spec.containers.ports
kubectl explain pod.spec.containers.readiness
kubectl explain pod.spec.containers.readinessProbe
kubectl explain pod.spec.containers.readinessProbe.tcpSocket
kubectl explain spec
kubectl explain .spec
kubectl explain ReplicaSet.spec.volumes
kubectl explain rs.spec
kubectl explain rs.spec.volumeMounts
kubectl explain rs.spec.volume
kubectl explain rs.spec
kubectl explain rs.spec.template
kubectl explain rs.spec.template.spec
kubectl explain rs.spec.template.spec.volumes
kubectl get all
cd volume/
ls
vi myapp-rs-hp.yaml
vi myapp-svc-hp.yaml
clear
kubectl explain svc.spec.type
kubectl create -f myapp-rs-emptydir.yaml -f myapp-rs-emptydir.yaml
kubectl get all
kubectl delete po,svc,rs
kubectl delete po,svc,rs --all
kubectl create -f myapp-rs-emptydir.yaml -f myapp-rs-emptydir.yaml
kubectl create -f myapp-svc-emptydir.yaml 
clear
kubectl get rs
kubectl get service
kubectl get po
kubectl exec myapp-rs-fortune-j5nmt -c web-server -- cat /usr/share/nginx/html/index.html
cat myapp-svc-emptydir.yaml 
curl 10.101.209.216
kubectl get all
kubectl delete po,svc,rs --all
kubectl get all
kubectl get --help
kubectl get -A
kubectl get --all-namespaces 
kubectl get all --all-namespaces 
clear
kubectl explain rs.volumes
ls
cat myapp-rs-hp.yaml 
cat myapp-svc-hp.yaml 
clear
cat myapp-rs-hp.yaml 
kubectl create -f myapp-rs-hp.yaml -f myapp-svc-hp.yaml 
vi myapp-rs-hp.yaml 
kubectl delete -f myapp-rs-hp.yaml -f myapp-svc-hp.yaml 
kubectl create -f myapp-rs-hp.yaml -f myapp-svc-hp.yaml 
kubectl get rs,po
clear
kubectl get svc,ep myapp-svc-hp
kubectl po -o wide
kubectl get po -o wide
kubectl describe po myapp-rs-hp-x76p5 
kubectl delete -f myapp-rs-hp.yaml
vi myapp-rs-hp.yaml 
kubectl create -f myapp-rs-hp.yaml 
kubectl get rs
kubectl get po -o wide
clear
kubectl get po -o wide
kubectl exec myapp-rs-hp-v587x -- cat /usr/share/ngiinx/html/index.html
kubectl exec myapp-rs-hp-v587x -- cat /usr/share/nginx/html/index.html
kubectl exec myapp-rs-hp-zq7jc -- cat /usr/share/nginx/html/index.html
kubectl get svc,ep myapp-svc-hp
kubectl get rs,po
curl 192.168.100.200
kubectl delete -f myapp-rs-hp.yaml -f myapp-svc-hp.yaml 
ls
kubectl get all
clear
sudo apt-get install -y nfs-kernel-server
clear
sudo mkdir /nfs-volume
echo "/nfs-volume *(rw,sync,no_subtree_check)" | sudo tee /etc/exports
cat /etc/exports
sudo chown -R nobody:bogroup /nfs-volume
sudo chown -R nobody:nogroup /nfs-volume
sudo chmod 777 /nfs-volume
echo "hello NFS volume" | sudo tee /nfs-volume/index.html
sudo ls -al /nfs-volume/
sudo chown -R nobody:nogroup /nfs-volume
sudo ls -al /nfs-volume/
sudo systemctl restart nfs-kernel-server
sudo systemctl status nfs-kernel-server.service 
history
cclear
clear
sudo iptables -A INPUT -p tcp --dport 2049 -j ACCEPT
vi myap-pv-nfs.yaml
ip a s
ls
vi myap-pv-nfs.yaml
mv myap-pv-nfs.yaml myapp-pv-nfs.yaml
ls
kubectl create -f myapp-pv-nfs.yaml
cat myapp-pv-nfs.yaml 
kubectl get persistentvolume
vi myapp-pvc-nfs.yaml
kubectl create -f myapp-pvc-nfs.yaml
kubectl get persistentvolumeclaims 
cat myapp-pvc-nfs.yaml 
kubectl describe myapp-pvc-nfs
kubectl describe persistentvolume myapp-pvc-nfs
kubectl describe persistentvolume myapp-pv-nfs
clear
kubectl get persistentvolume
kubectl api-resources 
ls
vi myapp-rs-nfs.yaml
clear
kubectl create -f myapp-rs-nfs.yaml 
vi myapp-rs-nfs.yaml 
kubectl create -f myapp-rs-nfs.yaml 
vi myapp-rs-nfs.yaml 
kubectl create -f myapp-rs-nfs.yaml 
vi myapp-rs-nfs.yaml 
kubectl create -f myapp-rs-nfs.yaml 
vi myapp-rs-nfs.yaml 
kubectl create -f myapp-rs-nfs.yaml 
vi myapp-rs-nfs.yaml 
kubectl create -f myapp-rs-nfs.yaml 
vi myapp-rs-nfs.yaml 
kubectl create -f myapp-rs-nfs.yaml 
vi myapp-rs-nfs.yaml 
kubectl create -f myapp-rs-nfs.yaml 
kubectl get rs
kubectl get po
kubectl describe persistentvolume myapp-pv-nfs 
kubectl describe persistentvolumeclaims myapp-pvc-nfs 
vi myapp-svc-nfs.yaml
kubectl create -f myapp-svc-nfs.yaml 
kubectl get svc
curl 192.168.100.200
clear
kubectl delete rs myapp-rs-nfs 
kubectl describe persistentvolumeclaims myapp-pvc-nfs 
kubectl create -f myapp-rs-nfs.yaml 
kubectl describe persistentvolumeclaims myapp-pvc-nfs 
kubectl delete rs myapp-rs-nfs 
kubectl delete persistentvolumeclaims myapp-pvc-nfs 
kubectl get persistentvolume
kubectl create -f myapp-pvc-nfs.yaml 
kubectl get persistentvolumeclaims 
clear
history
clear
kubectl delete persistentvolume myapp-pv-nfs 
kubectl create -f myapp-pv-nfs.yaml 
kubectl get persistentvolume
kubectl get persistentvolumeclaims 
kubectl get all
kubectl create -f myapp-rs-nfs.yaml 
kubectl get svc all
kubectl get svc
kubectl get ep
curl 192.168.100.200
kubectl delete -f myapp-svc-nfs.yaml 
kubectl delete -f myapp-rs-nfs.yaml -f myapp-pv-nfs.yaml 
kubectl get all
kubectl get rs,pv all
kubectl get rs,pv
kubectl delete -f myapp-pv-nfs.yaml 
kubectl delete -f myapp-pvc-nfs.yaml 
kubectl delete -f myapp-pv-nfs.yaml 
exit
kubectl get pv/
ls -l /dev/sd?
lsblk
exit
ls
cd volume/
ls
cd ..
ls c3
ls c4
ls d621/
ls testEx/
cat testEx/myweb-pod.yaml 
i go jal boinda
exit
ls
exit
kubectl get svc,ep
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.10.2/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.10.2/manifests/metallb.yaml
ls
cd testEx/
ls
cd ..
cd volume/
ls
cd ..
cd d621/
ls
cd ..
ip a s
vi configmap.yaml
vi myapp-svc-lb.yaml
kubectl create -f myapp-svc-lb.yaml
kubectl get svc,ep
curl 192.168.100.200
kubectl get svc
kubectl all -n metallb-system 
kubectl get all -n metallb-system 
vi myapp-svc-lb.yaml
vi configmap.yaml
ls
cd c3
ls
cd ../c4
s
ls
kubectl create -f myapp-rs.yaml
cd ../testEx/
ls
cd ../volume/
ls
cd ../d621/
ls
vi myapp-svc-lb.yaml 
vi metallb-config.yaml 
diff metallb-config.yaml ../configmap.yaml 
kubectl create -f myapp-rs.yaml
kubectl create -f myapp-svc-np.yaml
kubectl get nodes -o wide
kubectl get service myapp-svc-np 
kubectl get endpoints myapp-svc-np 
kubectl get service myapp-svc-np 
curl http://192.168.100.11:32359
curl http://192.168.100.12:32359
curl http://192.168.100.201
kubectl get svc
curl http://192.168.100.201:32024
curl http://192.168.100.202
curl http://192.168.100.203
netstat -rn
sudo apt install net-tools
netstat -rn
ping 192.168.100.200
ping 192.168.100.21
vi metallb-config.yaml 
cd ..
vi configmap.yaml 
kubectl delete svc myapp-svc-lb 
kubectl create -f myapp-svc-lb.yaml
kubectl get svc, ep
kubectl get svc,ep
curl http://192.168.100.21
curl http://192.168.100.200
exit
kubectl get po -A
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml
kubectl get ns
kubectl get pods -n ingress-nginx 
kubectl get svc -n ingress-nginx 
kubectl edit svc -n ingress-nginx ingress-nginx-controller
kubectl get nodes
kubectl get nodes -o wide
kubectl edit svc -n ingress-nginx ingress-nginx-controller
kubectl get svc -n ingress-nginx 
kubectl api-resources | grep ^ingress
kubectl api-versions | grep ^networking.k8s
kubectl explain ingress
ls
ls volume/
ls d621/
vi d621/myapp-
vi d621/myapp-ing.yaml
cd d621/
ls
kubectl create -f myapp-rs.yaml myapp-svc-np.yaml 
kubectl create -f myapp-rs.yaml -f  myapp-svc-np.yaml 
kubectl get ingresses.networking.k8s.io 
kubectl create -f myapp-ing.yaml 
kubectl get ingresses.networking.k8s.io 
kubectl describe ingresses.networking.k8s.io 
kubectl describe ingresses.networking.k8s.io myapp-ing 
curl --resolve myapp.example.com:80:192.168.200.21
curl --resolve myapp.example.com:80:192.168.200.51
kubectl get all
kubectl delete rs
kubectl delete rs myapp-rs
kubectl get all
kubectl create -f myapp-rs.yaml -f  myapp-svc-np.yaml 
kubectl get all
kubectl create -f myapp-ing.yaml 
kubectl get ingresses.networking.k8s.io 
kubectl delete ingress myapp-ing 
kubectl create -f myapp-ing.yaml 
kubectl get ingresses.networking.k8s.io 
kubectl delete ingress myapp-ing 
kubectl create -f myapp-ing.yaml 
kubectl describe ingresses.networking.k8s.io myapp-ing 
kubectl get ingresses.networking.k8s.io 
curl --resolve myapp.example.com:80:192.168.200.21
vi myapp-ing.yaml 
kubectl get ingresses.networking.k8s.io 
curl --resolve myapp.example.com:80:192.168.100.21
curl --resolve myapp.example.com:80:192.168.100.51
kubectl get all
LS
ls
kubectl get ing
curl http://192.168.100.21
curl http://192.168.100.21 -I
curl http://192.168.100.21 -v
curl --resolve myapp.example.com:80:192.168.100.21 http://myapp.example.com
curl --resolve myapp.example.com:80:192.168.100.21 -v http://myapp.example.com
curl http://myapp.example.com
vi /etc/hosts
host 192.168.100.21.nip.io
curl http://192.168.100.21.nip.io
curl http://192.168.100.21.nip.io/hello
curl http://www.192.168.100.21.nip.io/hello
vi /etc/hosts
vi myapp-ing.yaml 
vi myapp-ing-multi-paths.yaml 
vi myapp-ing-multi-hosts.yaml 
kubectl explain pod
kubectl explain pod.spec.volumes
kubectl explain pod.spec.volumes.empthDir
kubectl explain pod.spec.volumes.emptyDir
cd 
ls
cd volume/
ls
vi myapp-svc-emptydir.yaml 
vi myapp-rs-emptydir.yaml 
fortune
apt install fortune-mod
sudo apt install fortune-mod
fortune
vi myapp-svc-emptydir.yaml 
vi myapp-rs-emptydir.yaml 
kubectl create -f myapp-svc-emptydir.yaml  -f myapp-rs-emptydir.yaml 
kubectl get po

vi myapp-pod-git.yaml 
kubectl get rs
kubectl get pods
kubectl get svc myapp-svc-fortune 
kubectl exec myapp-rs-fortune-h5272 -c web-server -- cat /usr/share/nginx/html/index.html
kubectl describe myapp-rs-forturne
kubectl describe myapp-rs-fortune
kubectl describe myapp-rs-emptydir.yaml 
kubectl describe myapp-rs-emptydir
kubectl get all
kubectl describe myapp-svc-emptydir.yaml 
curl http://192.168.100.21
kubectl describe pod myapp-rs-fortune-h5272 
kubectl explain pod.spec.volumes.hostPath
kubectl explain pod.spec.volumes.initContainer
kubectl explain pod.spec.volumes.initContainers
kubectl explain pod.spec.volumes
ls
kubectl exec -it myapp-rs-fortune-h5272  --sh
kubectl exec -it myapp-rs-fortune-h5272  -- sh
kubectl exec -it myapp-rs-fortune-h5272 -c html-generator -- sh
curl http://192.168.100.21
curl http://192.168.100.22
ls
kubectl create -f myapp-rs-hp.yaml -f myapp-svc-hp.yaml 
kubectl get rs,po
kubectl get pods -o wide
kubectl create -f myapp-pod-git.yaml 
kubectl get pods --watch
kubectl exec myapp-pod-git -- ls -l /repo
kubectl get pods --watch
sudo apt install -y nfs-kernel-server
sudo mkdir /nfs-volume
sudo chown -R nobody:nogroup /nfs-volume
sudo chmod 777 /nfs-volume
sudo systemctl restart nfs-kernel-server
sudo systemctl status nfs-kernel-server
sudo apt install -y nfs-common
ls
vi myapp-pv-nfs.yaml 
vi myapp-pvc-nfs.yaml 
vi myapp-pv-nfs.yaml 
kubectl create -f myapp-pv-nfs.yaml 
kubectl get persistentvolume
vi myapp-pvc-nfs.yaml 
kubectl create -f myapp-pvc-nfs.yaml 
kubectl get persistentvolumeclaims 
kubectl get persistentvolume
kubectl create -f myapp-rs-nfs.yaml 
kubectl get rs
vi myapp-rs-nfs.yaml 
kubectl get po
kubectl describe persistentvolume myapp-pv-nfs 
vi myapp-rs-nfs.yaml 
kubectl describe persistentvolumeclaims myapp-pv-nfs 
kubectl describe persistentvolumeclaims myapp-pvc-nfs
vi myapp-svc-nfs.yaml 
kubectl create -f myapp-svc-nfs.yaml 
curl http://192.168.100.200
curl http://192.168.100.11
echo "nfs-volume *(rw,sync,no_subtree_check)" | sudo tee /etc/exports
echo "hello NFS volume" | sudo tee /nfs-volume/index.html
sudo chown -R nobody:nogroup /nfs-volume
sudo chmod 777 /nfs-volume
sudo systemctl restart nfs-kernel-server
sudo systemctl status nfs-kernel-server
curl http://192.168.100.11
curl http://192.168.100.200
curl http://192.168.100.21
curl http://192.168.100.22
kubectl explain sc
kubectl get all,pvc,pv
kubectl delete all,pvc,pv
kubectl delete all
kubectl delete pvc,pv
kubectl delete pvc
kubectl get all,pvc,pv
kubectl delete rs
kubectl delete rs --all
kubectl delete po,pvc,pv --all
kubectl get all,pvc,pv
kubectl delete svc --all
exit
lsblk -f
git clone --single-branch --branch v1.6.7 https://github.com/rook/rook.git
cd rook/cluster/examples/kubernetes/ceph
kubectl create -f crds.yaml -f common.yaml -f operator.yaml
ls
kubectl create -f crds.yaml -f common.yaml -f operator.yaml
vi crds.yaml 
kubectl get all
systemctl status kubectl
kubectl --version
kubectl
ip a s
kubectl create -f crds.yaml -f common.yaml -f operator.yaml
ping 192.168.100.11e
ping 192.168.100.21
ping 192.168.100.200
exit
lsblk -f
cd rook/cluster/examples/kubernetes/ceph
kubectl create -f crds.yaml -f common.yaml -f operator.yaml
kubectl version 
sudo cp /etc/kubernetes/admin.conf ~/.kube/config && sudo chown $(id -u):$(id -g) $HOME/.kube/config
minikube service list
kubectl get nodes
ip a s
kubectl get componentstatuses
kubeamd version
kubeadm version
sudo netstat -lnpt|grep kube
netstat -a | grep 6443
ls
cd 
ls
vi .kube/config 
curl http://192.168.100.11:6443
kubectl get pods
exit
exir
exit
