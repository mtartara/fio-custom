## Build

`docker build . -t fio-pod:latest`

---

## Openshift

`oc run fio-pod --image=docker-registry.default.svc:5000/openshift/fio-pod:latest --limits=cpu=2,memory=2Gi --requests=cpu=2,memory=2Gi -- tail -f /dev/null`

`oc set resources dc/fio-pod --limits=cpu=2,memory=2Gi --requests=cpu=2,memory=2Gi`

`oc set volume dc/fio-pod --add -t pvc --name=test --claim-name=test-post-upgrade-1 --mount-path=/test`

---

## Fio Command

`fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=random_read_write.fio --bs=4k --iodepth=64 --size=4G --readwrite=randrw --rwmixread=75`

`fio --ioengine=libaio --filename=fio.test --size=256M --direct=1 --rw=randrw --refill_buffers --norandommap --bs=8k --rwmixread=70 --iodepth=16--numjobs=16 --runtime=60 --group_reporting --name=fio-test`
