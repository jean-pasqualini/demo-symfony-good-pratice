deploy-on-ic:
	rsync -rtv --exclude=".git" ./ pasqualini@23.251.140.54:/var/www/master/
