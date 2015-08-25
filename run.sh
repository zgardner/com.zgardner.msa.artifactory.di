container_volume_data_mount_path="/artifactory/data"
container_volume_logs_mount_path="/artifactory/logs"
container_volume_backup_mount_path="/artifactory/backup"
host_volume_data_mount_path="$(pwd)$container_volume_data_mount_path"
host_volume_logs_mount_path="$(pwd)$container_volume_logs_mount_path"
host_volume_backup_mount_path="$(pwd)$container_volume_backup_mount_path"
container_name="com.zgardner.msa.artifactory"
artifactory_version="3.9.2"
host_artifactory_port="8070"
container_artifactory_port="8080"

echo "Killing existing container $container_name..."
docker kill $container_name

echo "Removing existing container $container_name..."
docker rm $container_name

echo "Starting new container $container_name..."
echo "-- docker run -d --name $container_name -v $host_volume_data_mount_path:$container_volume_data_mount_path -v $host_volume_logs_mount_path:$container_volume_logs_mount_path -v $host_volume_backup_mount_path:$container_volume_backup_mount_path -p $host_artifactory_port:$container_artifactory_port mattgruter/artifactory:$artifactory_version --"
docker run -d --name $container_name -v $host_volume_data_mount_path:$container_volume_data_mount_path -v $host_volume_logs_mount_path:$container_volume_logs_mount_path -v $host_volume_backup_mount_path:$container_volume_backup_mount_path -p $host_artifactory_port:$container_artifactory_port mattgruter/artifactory:$artifactory_version
