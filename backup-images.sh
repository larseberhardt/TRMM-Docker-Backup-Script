for i in `docker inspect --format='{{.Name}}' $(docker ps -q) | cut -f2 -d\/ | grep 'trmm'`
    do container_name=$i
    echo -n "$container_name - "
    container_image=`docker inspect --format='{{.Config.Image}}' $container_name`
    mkdir -p $backup_path/$container_name
    save_file="$backup_path/$container_name/$container_name-image-$date.tar"
    docker save -o $save_file $container_image
    echo "OK"
    if [ ! -z "$days" ]; then
        echo 'Delete Backups in' $container_name 'which are older then '$days 'days'
        find $backup_path/$container_name -name "*.tar" -mtime +$days -delete
    fi
done
