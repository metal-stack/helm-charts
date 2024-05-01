KUBECONFIG := $(shell pwd)/.kubeconfig

ifeq ($(CI),true)
  DOCKER_TTY_ARG=
else
  DOCKER_TTY_ARG=t
endif

.PHONY: test-csi-driver-lvm
test-csi-driver-lvm:
	@if ! which kind > /dev/null; then echo "kind needs to be installed"; exit 1; fi
	@if ! kind get clusters | grep csi-driver-lvm > /dev/null; then \
		kind create cluster \
		  --name csi-driver-lvm \
			--config tests/csi-driver-lvm/kind.yaml \
			--kubeconfig $(KUBECONFIG); fi
	@cd tests/csi-driver-lvm && docker build -t csi-bats . && cd -
	docker run -i$(DOCKER_TTY_ARG) \
		-v "$(KUBECONFIG):/root/.kube/config" \
		-v "$(PWD)/tests/csi-driver-lvm:/code" \
		-v "$(PWD)/charts/csi-driver-lvm:/chart" \
		--network host \
		csi-bats \
		--verbose-run --trace --timing bats/test.bats

.PHONY: cleanup-csi-driver-lvm
cleanup-csi-driver-lvm:
	kind delete cluster --name csi-driver-lvm
