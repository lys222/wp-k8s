lsblk -f
sudo apt-get install && apt-transport-https && ca-certificates && curl && gnupg && lsb-release
sudo apt-get install ca-certificates && curl && gnupg && lsb-release
echo   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo docker ps
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
kubeadm version
kubectl version
kubelet version
sudo kubeadm init --control-plane-endpoint 192.168.200.50 --pod-network-cidr 192.168.0.0/16 --apiserver-advertise-address 192.168.200.50
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
ls -l ~/.kube/config 
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
kubectl get nodes
watch -n1 -d kubectl get nodes
kubectl get pods -A
git clone --single-branch --branch v1.6.7 https://github.com/rook/rook.git
cd rook/cluster/examples/kubernetes/ceph
kubectl create -f crds.yaml -f common.yaml -f operator.yaml
kubectl create -f cluster.yaml
watch -n1 -d kubectl -n rook-ceph get pod
kubectl create -f csi/rbd/storageclass.yaml
kubectl create -f filesystem.yaml
kubectl -n rook-ceph get pod -l app=rook-ceph-mds
kubectl create -f csi/cephfs/storageclass.yaml
kubectl get sc
kubectl create -f toolbox
kubectl create -f toolbox.yaml 
ls
kubectl -n rook-ceph exec -it deploy/rook-ceph-tools --ceph -s
kubectl -n rook-ceph exec deploy/rook-ceph-tools --ceph -s
kubectl -n rook-ceph exec deploy/rook-ceph-tools -- ceph -s
cd
ls
ls -al
git config --global user.name lys222
git remote add origin https://github.com/lys222/k8s
git init
git remote add origin https://github.com/lys222/k8s
git pull origin master
ls
cd rook
ls
cd 
exit
ls
rm -rf myapp-svc-lb.yaml 
ls
mkdir proj
cd proj/
ls
kubectl get all
vi pv.yaml
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc 
kubectl create pv.yaml 
kubectl create -f pv.yaml 
kubectl get pv
curl -LO https://k8s.io/examples/application/wordpress/mysql-deployment.yaml
curl -LO https://k8s.io/examples/application/wordpress/wordpress-deployment.yaml
vi kustomization.yaml
vi wordpress-deployment.yaml 
ip a s
kubectl create -f mysql-deployment.yaml -f wordpress-deployment.yaml 
kubectl get secrets 
kubectl delete -f mysql-deployment.yaml -f wordpress-deployment.yaml 
kubectl delete -f pv.yaml 
kubectl create pv.yaml 
kubectl create -f  pv.yaml 
kubectl apply -k ./
kubectl get secrets 
kubectl get pvc
kubectl get pv
kubectl get pvc
kubectl delete -f mysql-deployment.yaml -f wordpress-deployment.yaml 
vi wordpress-deployment.yaml 
kubectl apply -k ./
kubectl get pvc
watch -n1 -d kubectl get pvc
kubectl delete -f mysql-deployment.yaml -f wordpress-deployment.yaml 
kubectl delete -f kustomization.yaml 
kubectl delete -f pv.yaml 
kubectl get all
kubectl get pv
kubectl create -f  pv.yaml 
kubectl get pv
vi mysql-deployment.yaml 
vi wordpress-deployment.yaml 
kubectl get pv
kubectl apply -k ./
kubectl get pvc
vi wordpress-deployment.yaml 
kubectl delete -f mysql-deployment.yaml -f wordpress-deployment.yaml 
vi wordpress-deployment.yaml 
kubectl apply -k ./
kubectl get pvc
kubectl delete -f mysql-deployment.yaml -f wordpress-deployment.yaml 
vi wordpress-deployment.yaml 
kubectl apply -k ./
kubectl get pvc
kubectl delete -f mysql-deployment.yaml -f wordpress-deployment.yaml 
kubectl delete -f pv.yaml 
vi wordpress-deployment.yaml 
kubectl create -f pv.yaml 
kubectl apply -k ./
kubectl get pvc
kubectl get pods
kubectl get services
curl 192.168.200.50:80
curl http://192.168.200.50:80
ping 192.168.200.50
kubectl delete -f mysql-deployment.yaml -f wordpress-deployment.yaml 
kubectl delete -f pv.yaml 
vi wordpress-deployment.yaml 
kubectl create -f pv.yaml 
kubectl apply -k ./
kubectl get pvc
kubectl get service wordpress
kubectl delete -f mysql-deployment.yaml -f wordpress-deployment.yaml 
kubectl delete -f pv.yaml 
vi wordpress-deployment.yaml 
kubectl create -f pv.yaml 
kubectl apply -k ./
kubectl get pvc
kubectl get pods
kubectl get svc
curl 192.168.200.51
ping 192.168.200.51
curl 192.168.200.51:80
curl http://192.168.200.51:80
kubectl delete -f mysql-deployment.yaml -f wordpress-deployment.yaml 
kubectl delete -f pv.yaml 
vi wordpress-deployment.yaml 
kubectl create -f pv.yaml 
kubectl apply -k ./
kubectl get pvc
kubectl describe svc wordpress
kubectl get endpoints wordpress
kubectl get pods -o wide
kubectl get service wordpress
curl http://192.168.200.50:31584
exit
