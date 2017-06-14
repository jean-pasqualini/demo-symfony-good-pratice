IC_IP=${IC_IP:=104.155.108.175}
IC_USERNAME=${IC_USERNAME:=jpasqualini75}
IC_IPU=$IC_USERNAME@$IC_IP

echo "--> server $IC_IPU"

function app:deploy-on-ic()
{
    branch=$(app:branch:show)
    ssh -t $IC_IPU sudo mkdir /var/www/$branch
    ssh -t $IC_IPU sudo chown -R $IC_USERNAME:$IC_USERNAME /var/www/$branch
    rsync -rtv --exclude=".git" ./ $IC_IPU:/var/www/$branch/
    ssh -t $IC_IPU sudo chown -R www-data:www-data /var/www/$branch/var
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
