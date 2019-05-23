docker build --pull -t ffmpeg .
docker run --rm ffmpeg
echo "RUN: docker ps && docker cp ffmpeg_instance:/output/static/bin/ffmpeg.exe ."
