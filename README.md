# ALPHON X4 기반 DevSecOps 자동화 파이프라인
## 📌 프로젝트 개요

이 프로젝트는 ALPHON X4 IoT edge computer 위에서 실행되는 경량 DevSecOps 파이프라인으로,  
CI/CD 및 보안 검사 도구를 통합하여 완전 자동화된 이미지 빌드 및 배포 환경을 구성합니다.

## ✅ 주요 기술 스택

- **Jenkins**: CI/CD 자동화
- **Docker**: 컨테이너 이미지 빌드
- **K3s**: 경량 Kubernetes 클러스터
- **kubectl**: K3s 리소스 관리
- **Hadolint**: Dockerfile 보안 및 스타일 검사
- **Dockle**: Docker 이미지 보안 분석
- **GitHub Webhook**: 자동 빌드 트리거
---
## 🔐 DevSecOps 통합 흐름
![image](https://github.com/user-attachments/assets/e6f0a225-db02-4194-94d8-5390304cae0e)


## 🛠 Jenkins Build 스크립트

```bash
#!/bin/bash
set -e

echo "✅ Step 1. Dockerfile 린트 검사 (Hadolint)"
docker run --rm -i hadolint/hadolint < Dockerfile

echo "✅ Step 2. Docker 이미지 보안 정책 검사 (Dockle)"
dockle alphon-x4-app

echo "✅ Step 3. Docker 이미지 빌드"
docker build -t alphon-x4-app .

echo "✅ Step 4. Docker 이미지 containerd로 가져오기"
docker save -o alphon-x4-app.tar alphon-x4-app
k3s ctr images import alphon-x4-app.tar

echo "✅ Step 5. K3s 앱 롤링 재시작"
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
kubectl rollout restart deployment alphon-x4-app


🔐 대응 보안 항목
| 보안 위협       | 대응 방식                              
| -----------   | ----------------------------------  
| 비인가 접근      | Dockerfile 사용자 권한, 이미지 검사 (Dockle) 
| 서비스 거부(DoS) | Hadolint로 불필요 의존성 검사               
| 데이터 위변조     | K3s 컨테이너 재배포 자동화로 신뢰 확보            
| 복제 공격 대응    | (확장 가능) Cosign으로 이미지 서명 가능  
