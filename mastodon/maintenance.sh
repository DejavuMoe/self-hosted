sudo docker exec mastodon-web tootctl account cull --concurrency 4
sudo docker exec mastodon-web tootctl cache clear
sudo docker exec mastodon-web tootctl cache recount accounts --concurrency 4 --verbose
sudo docker exec mastodon-web tootctl cache recount statuses --concurrency 4 --verbose
sudo docker exec mastodon-web tootctl feeds clear
sudo docker exec mastodon-web tootctl feeds build --concurrency 4 --verbose
sudo docker exec mastodon-web tootctl media remove --days 7 --concurrency 4
sudo docker exec mastodon-web tootctl statuses remove --days 7
sudo docker exec mastodon-web tootctl preview_cards remove --days 7 --concurrency 4 --verbose
sudo docker exec mastodon-web tootctl media remove-orphans
sudo docker exec mastodon-web tootctl media refresh
sudo docker exec mastodon-web tootctl accounts refresh --all --concurrency 4 --verbose
sudo docker exec mastodon-web tootctl search deploy --concurrency 4
sudo docker exec mastodon-web tootctl media usage
