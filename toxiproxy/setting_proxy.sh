/go/bin/toxiproxy-cli create rails -l 0.0.0.0:8888 -u rails:8080
/go/bin/toxiproxy-cli create nginx -l 0.0.0.0:8889 -u nginx:80
/go/bin/toxiproxy-cli toxic add -t bandwidth -a rate=1 rails
/go/bin/toxiproxy-cli toxic add -t bandwidth -a rate=1 nginx