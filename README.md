# Prerequisite
1. Helm 설치
2. kubectl 설치
3. minikube 설치
4. terraform 설치

# minikube 를 통해 multi node 형성.

```
minikube start --memory 4GB --cpus 2 --nodes 3 -p airflow-demo
```
를 사용해 multi node minikube를 만든다.


volumesnapshots and csi-hostpath-driver addons 을 설치

```bash
minikube addons enable volumesnapshots -p airflow-demo
minikube addons enable csi-hostpath-driver -p airflow-demo
```

Dynamic provisioing 을 해당 storageclass default로 사용하고 싶다면 아래와 같이 기존 storageclass를 삭제하고 annotation을 추가하여 default storage class로 선언한다.

```bash
minikube addons disable storage-provisioner -p airflow-demo
minikube addons disable default-storageclass -p airflow-demo
kubectl patch storageclass csi-hostpath-sc -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```

Dynamic provisioing csi-hostpath-sc 는 permission 문제가 있고, hostpath daemonset 이 잘 형성이 안되는 문제가 있음... 다른 대체재를 사용
kubevirt.io/hostpath-provisioner 를 사용한다. 

```bash
kubectl apply -f storageclass.yaml
```
