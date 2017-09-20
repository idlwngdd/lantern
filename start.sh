# Build
docker build -t wilon/lantern .

# run
docker run -itd --restart=always --name lantern -p 3128:3128 -p 8080:8080 wilon/lantern

# test
curl -kx 127.0.0.1:3128 -w %{time_namelookup}::%{time_connect}::%{time_starttransfer} https://www.google.com/humans.txt