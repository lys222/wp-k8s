# kubeadm으로 kubernetes 클러스터 배포

## [kubeadm, kubelet 및 kubectl 설치](https://kubernetes.io/ko/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)

모든 머신에 다음 패키지들을 설치한다.

- `kubeadm`: 클러스터를 부트스트랩하는 명령이다.
- `kubelet`: 클러스터의 모든 머신에서 실행되는 파드와 컨테이너 시작과 같은 작업을 수행하는 컴포넌트이다.
- `kubectl`: 클러스터와 통신하기 위한 커맨드 라인 유틸리티이다.

kubeadm은 kubelet 또는 kubectl 을 설치하거나 관리하지 않으므로, kubeadm이 설치하려는 쿠버네티스 컨트롤 플레인의 버전과 일치하는지 확인해야 한다.

그렇지 않으면, 예상치 못한 버그 동작으로 이어질 수 있는 버전 차이(skew)가 발생할 위험이 있다.

그러나, kubelet과 컨트롤 플레인 사이에 하나의 마이너 버전 차이가 지원되지만, kubelet 버전은 API 서버 버전 보다 높을 수 없다.

```bash
# apt 패키지 색인을 업데이트하고, 쿠버네티스 apt 리포지터리를 사용하는 데 필요한 패키지를 설치
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

# 구글 클라우드의 공개 사이닝 키를 다운로드
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

# 쿠버네티스 apt 리포지터리를 추가
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# apt 패키지 색인을 업데이트하고, kubelet, kubeadm, kubectl을 설치하고 해당 버전을 고정
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

# [노드 추가](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)

```bash
#[Control Plane]
sudo kubeadm init --control-plane-endpoint [IP] --pod-network-cidr [IP] --apiserver-advertise-address [IP]

#루트가 아닌 사용자에 대해 kubectl이 작동하도록 다음 명령 실행
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
ls -l ~/.kube/config

#Pod 네트워크 추가 기능 설치
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
kubectl get nodes #Ready인지 확인

#[Worker Node]
#노드 조인
sudo kubeadm join --token [TOKEN] --discovery-token-ca-cert-hash sha256:[HASH]
#Control Plane에서 kubedam get nodes 확인, 순차적으로 준비됨(조금 시간 걸림)

#[Control Plane]
kubectl get nodes
kubectl get pods -A
```

# 버전 업그레이드

### [버전 차이 정책](https://kubernetes.io/ko/releases/version-skew-policy/)

## [1.20.x →  1.21.x](https://kubernetes.io/ko/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/)

- **업그레이드 작업 절차**
    1. 기본 컨트롤 플레인 노드를 업그레이드한다.
    2. 추가 컨트롤 플레인 노드를 업그레이드한다.
    3. 워커(worker) 노드를 업그레이드한다.

### 컨트롤 플레인 노드 업그레이드

```bash
**#첫 번째 컨트롤 플레인 노드의 경우**
#*kubeadm* 업그레이드
#방법1) 1.21.x-00에서 x를 최신 패치 버전으로 바꾼다.   #x는 숫자임
sudo apt-mark unhold kubeadm && \
sudo apt-get update && sudo apt-get install -y kubeadm=1.21.x-00 && \   
sudo apt-mark hold kubeadm
-
#방법2) apt-get 버전 1.1부터 다음 방법을 사용할 수도 있다
sudo apt-get update && \
sudo apt-get install -y --allow-change-held-packages kubeadm=1.21.x-00

kubeadm version        #다운로드하려는 버전이 잘 받아졌는지 확인
kubeadm upgrade plan   #업그레이드 계획을 확인
sudo kubeadm upgrade apply v1.21.x   # 이 업그레이드를 위해 선택한 패치 버전으로 x를 바꾼다.

**#다른 컨트롤 플레인 노드의 경우**
sudo kubeadm upgrade node
sudo kubeadm upgrade apply

**#모든 컨트롤 플레인 노드에서**
#*kubelet* 업그레이드
#방법1) 1.21.x-00의 x를 최신 패치 버전으로 바꾼다
sudo apt-mark unhold kubelet kubectl && \
~~sudo apt-get update &&~~ apt-get install -y kubelet=1.21.x-00 kubectl=1.21.x-00 && \
sudo apt-mark hold kubelet kubectl
 
#방법2) apt-get 버전 1.1부터 다음 방법을 사용할 수도 있다
~~sudo apt-get update && \~~
sudo apt-get install -y --allow-change-held-packages kubelet=1.21.x-00 kubectl=1.21.x-00

#*kubectl* 업그레이드
sudo systemctl daemon-reload
sudo systemctl restart kubelet
```

### 워커 노드 업그레이드

```bash
# *kubeadm* 업그레이드
sudo apt-get update && \
sudo apt-get install -y --allow-change-held-packages kubeadm=1.21.x-00
sudo kubeadm upgrade node

# *kubelet*, *kubectl* 업그레이드
sudo apt-get update && \
sudo kubeadm upgrade node
****sudo apt-get install -y --allow-change-held-packages kubelet=1.21.x-00 kubectl=1.21.x-00
sudo systemctl daemon-reload
sudo systemctl restart kubelet

kubectl get nodes #업그레이드 된 버전 확인
```

# 애드온

## [MetalLb](https://metallb.universe.tf/installation/)

```bash
#Manifest에 의한 설치
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.10.2/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.10.2/manifests/metallb.yaml

vi configmap.yaml      #아래 코드 참고
```

```yaml
apiVersion: v1
kind: ConfingMap
metadata:
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - [IP1]-[IP2]
```

---

## [Ingress](https://kubernetes.github.io/ingress-nginx/deploy/)

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml

kubectl edit svc -n ingress-nginx ingress-nginx-controller  #아래 코드 추가
```

```yaml
.
.
spec:
  clusterIP: [CLUSTER_IP]
  externalIPs:
  - [NODE_IP_1]
  - [NODE_IP_2]
  - [NODE_IP_3]
.
.
.
```

---

## [Rook](https://rook.io/docs/rook/v1.6/ceph-quickstart.html)

빈 디스크 생성해야함 → vagrantfile 수정

```yaml
#모든 리소스 다 지우기
#새로운 Vagrantfile 복붙

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # k-control VM
  config.vm.define "kube-control1" do |config|
    config.vm.box = "ubuntu/focal64"
    config.vm.provider "virtualbox" do |vb|
       vb.name = "kube-control1"
       vb.cpus = 2
       vb.memory = 3000
    end
    config.vm.hostname = "kube-control1"
    config.vm.network "private_network", ip: "192.168.200.50"
  end

  # k-node1 VM
  config.vm.define "kube-node1" do |config|
    config.vm.box = "ubuntu/focal64"
    config.vm.provider "virtualbox" do |vb|
      vb.name = "kube-node1"
      vb.cpus = 2
      vb.memory = 3000
      unless File.exist?('./.disk/ceph1.vdi')
       vb.customize ['createmedium', 'disk', '--filename', './.disk/ceph1.vdi', '--size', 10240]
      end
      vb.customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium',
'./.disk/ceph1.vdi']
    end
    config.vm.hostname = "kube-node1"
    config.vm.network "private_network", ip: "192.168.200.51"
  end

  # k-node2 VM
  config.vm.define "kube-node2" do |config|
    config.vm.box = "ubuntu/focal64"
    config.vm.provider "virtualbox" do |vb|
      vb.name = "kube-node2"
      vb.cpus = 2
      vb.memory = 3000
      unless File.exist?('./.disk/ceph2.vdi')
        vb.customize ['createmedium', 'disk', '--filename', './.disk/ceph2.vdi', '--size', 10240]
      end
      vb.customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium',
'./.disk/ceph2.vdi']
    end
    config.vm.hostname = "kube-node2"
    config.vm.network "private_network", ip: "192.168.200.52"
  end

  # k-node3 VM
  config.vm.define "kube-node3" do |config|
    config.vm.box = "ubuntu/focal64"
    config.vm.provider "virtualbox" do |vb|
      vb.name = "kube-node3"
      vb.cpus = 2
      vb.memory = 3000
      unless File.exist?('./.disk/ceph3.vdi')
        vb.customize ['createmedium', 'disk', '--filename', './.disk/ceph3.vdi', '--size', 10240]
      end
      vb.customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium',
'./.disk/ceph3.vdi']
    end
    config.vm.hostname = "kube-node3"
    config.vm.network "private_network", ip: "192.168.200.53"
  end
end
```

```bash
vagrant reload
#-----------------------------------------------------------------------------
#모든 노드에서 확인
lsblk -f       #빈 디스크가 1개씩 추가 되어야함
#-----------------------------------------------------------------------------
git clone --single-branch --branch v1.6.7 https://github.com/rook/rook.git
cd rook/cluster/examples/kubernetes/ceph

kubectl create -f crds.yaml -f common.yaml -f operator.yaml

#Cluster 생성
kubectl create -f cluster.yaml #(3 worker)
#kubectl create -f cluster-test.yaml #(1 worker)

watch -n1 -d kubectl -n rook-ceph get pod  #설치 확인

#Block Storage 생성 
kubectl create -f csi/rbd/storageclass.yaml

#File System 생성
kubectl create -f filesystem.yaml #(3 worker)
#kubectl create -f filesystem-test.yaml #(1 worker)
kubectl create -f csi/cephfs/storageclass.yaml

kubectl get sc  #확인

#정상적으로 설치 되었는지 확인
kubectl create -f toolbox.yaml
kubectl -n rook-ceph exec deploy/rook-ceph-tools -- ceph -s # health: HEALTH_WARN 또는 HEALTH_OK 인지 확인
```

---

## [Metrics-Server](https://github.com/kubernetes-sigs/metrics-server)

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl edit deployment metrics-server -n kube-system
#.spec.template.spec.containers.args 에 아래 코드 추가
#- --kubelet-insecure-tls

#확인
kubectl get deployment metrics-server -n kube-system
kubectl top nodes
```
