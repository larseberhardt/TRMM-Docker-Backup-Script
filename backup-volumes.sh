for i in `docker inspect --format='{{.Name}}' $(docker ps -q) | cut -f2 -d\/ | grep 'trmm'`
		do container_name=$i
		mkdir -p $backup_path/$container_name
		echo -n "$container_name - "
		docker run --rm --userns=host \
		--volumes-from $container_name \
		-v $backup_path:/backup \
		-e TAR_OPTS="$tar_opts" \
		piscue/docker-backup \
		backup "$container_name/$container_name-volume-$date.tar.xz"
	echo "OK"
	if [ ! -z "$days" ]; then
		echo 'Delete Backups in' $container_name 'which are older then '$days 'days'
		find $backup_path/$container_name -name "*.xz" -mtime +$days -delete
	fi
done