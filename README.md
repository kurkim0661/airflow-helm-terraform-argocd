# Prerequisite
1. Helm 설치
2. kubectl 설치
3. minikube 설치
4. terraform 설치

# Intro
local 환경에서 최근 DevOps + Data Engineer 들이 많이 사용하는 플랫폼들을 사용하여 환경을 구축하여 테스트 해볼 수 있는 테스트 베드 구축!

* Terraform
* ArgoCD
* Airflow

를 활용해보자.

# minikube 를 통해 multi node 형성.
airflow 동작을 위한 최소 사양인 mem 4GB cpu 2 를 준다.
```
minikube start --memory 4GB --cpus 2 --nodes 3 -p airflow-demo
```
를 사용해 multi node minikube를 만든다.


# minikube multi node 사용시 주의점
기존 standard storageclass로는 dynamic provisioning이 정상동작하지 않기 때문에 custom storageclass를 이용해줘야한다.
minikube official docs에서 제공하는 방식을 사용해봤지만 csi-hostpath-driver 에 현재 storage 에 대한 permission denied 문제가 존재한다. 
이에 securityContext를 root로 줘야만 동작이 되기 때문에 다른 custom storageclass를 이용한다.

## Official docs 방식
volumesnapshots and csi-hostpath-driver addons 을 설치 ( 테스트 당시 문제가 있었음 )
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

## kubevirt.io 를 활용하는 방식
kubevirt.io/hostpath-provisioner 를 사용한다. 

```bash
kubectl delete sc standard
kubectl apply -f storageclass.yaml
```