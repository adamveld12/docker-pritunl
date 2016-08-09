build:
	docker build -t adamveld12/docker-pritunl .

run:
	docker run -it --privileged -p 80:80 -p 443:443/tcp -p 1194:1194/udp -p 1194:1194/tcp -p 9700:9700/tcp adamveld12/docker-pritunl

push: build
	docker push adamveld12/docker-pritunl

clean:
	docker rmi adamveld12/docker-pritunl

.PHONY: clean build push run run_prod
