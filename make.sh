function app:deploy-on-ic()
{
    branch=$(app:branch:show)
    rsync -rtv --exclude=".git" ./ pasqualini@23.251.140.54:/var/www/$branch/
    ssh -t pasqualini@23.251.140.54 sudo chown -R www-data:www-data /var/www/$branch/var
}

function app:deploy-on-ic:isolate()
{
    docker build -t app:latest .
    docker run --rm -it app:latest
    docker rmi app:latest
}

function app:branch:show()
{
	echo $(git branch | grep "*" | awk '{print $2}')
}
