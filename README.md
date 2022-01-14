# poky-actions
run poky project on github actions

chown -R 1000:1000 $(pwd)
docker run --rm -it -v $(pwd):$(pwd) crops/poky --workdir=$(pwd)

A：编译kodi时，
      容器内添加jre（编译kodi需要java）：
	1、正常启动容器。
	2、从另外shell以root身份登录1步启动的容器。
   	 docker exec -it --user=root d75dac7e6392 bash 
	3、以root身份安装jre：
    	apt-get install -y --no-install-recommends software-properties-common
    	add-apt-repository -y ppa:openjdk-r/ppa
    	apt-get update
    	apt-get -y install default-jre

B：手动下载软件包方法：
	1、下载软件包。
	2、生成.done文件。
   	touch chromium-96.0.4664.110.tar.xz chromium-96.0.4664.110.tar.xz.done
	3、将.done文件改为777权限。

C：crops/toaster
	chown -R 1000:1000 $(pwd)
	docker run -it --rm -p 0.0.0.0:18000:8000 -v /home/toaster-container:/workdir crops/toaster



D：编译docker-ce时，须修改：
	在 docker-ce_git.bb 里
	在 if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then下
	添加：
 		install -d ${D}${sysconfdir}/init.d
		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init	      


E：编译podman时，须修改：
	crun_git.bb   line 15 替换为：
      	git://github.com/opencontainers/runtime-spec.git;branch=main;name=rspec;destsuffix=git/libocispec/runtime-spec;protocol=https \