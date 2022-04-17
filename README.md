![alt text](https://img.shields.io/docker/automated/kolyadin/live-video-broadcasting.svg)
![alt text](https://img.shields.io/docker/build/kolyadin/live-video-broadcasting.svg)
![alt text](https://img.shields.io/docker/pulls/kolyadin/live-video-broadcasting.svg)

# About

This container is grabbing web page (picture + audio) using web browser and transcode it in rtmp video stream. 

### Youtube live video:

Tech specs:  
https://support.google.com/youtube/answer/2853702?hl=en
```bash
$ docker run -it --rm \
      -e GRAB_URL="https://www.youtube.com/watch?v=hUj65M4T1cg" \
      -e RTMP_URL="rtmp://a.rtmp.youtube.com/live2/0987-6543-2109-8765" \
      -e LANGUAGE="en" \
      -e V_BITRATE="3000K" \
      -e A_BITRATE="128K" \
      kolyadin/live-video-broadcasting
```

#### Twitch.tv

Tech specs:  
https://stream.twitch.tv/encoding/  
https://stream.twitch.tv/ingests/

```bash
$ docker run -it --rm \
      -e GRAB_URL="https://www.youtube.com/watch?v=hUj65M4T1cg" \
      -e RTMP_URL="rtmp://live-fra.twitch.tv/app/live_0987654321_12345678900987654321" \
      -e LANGUAGE="en" \
      -e V_BITRATE="3000K" \
      -e A_BITRATE="128K" \
      kolyadin/live-video-broadcasting
```

#### Facebook live video:

Tech specs:  
https://developers.facebook.com/docs/videos/live-video/best-practices#specs

```bash
$ docker run -it --rm \
      -e GRAB_URL="https://www.youtube.com/watch?v=hUj65M4T1cg" \
      -e RTMP_URL="rtmp://live-api.facebook.com:80/rtmp/1234567890?s_ps=1&a=0987654321" \
      -e LANGUAGE="en" \
      -e V_BITRATE="3000K" \
      -e A_BITRATE="128K" \
      kolyadin/live-video-broadcasting
```

#### VK live video:

Tech specs:  
https://vk.com/page-135678176_54378816

```bash
$ docker run -it --rm \
      -e GRAB_URL="https://www.youtube.com/watch?v=hUj65M4T1cg" \
      -e RTMP_URL="rtmp://stream.vkuserlive.com:443/live?srv=098765&s=098765432112345678900987654321=123456789" \
      -e LANGUAGE="en" \
      -e V_BITRATE="3000K" \
      -e A_BITRATE="128K" \
      kolyadin/live-video-broadcasting
```


export V_BITRATE="3000K"
export A_BITRATE="128K"
ffmpeg -thread_queue_size 512 -draw_mouse 0 \
    -f x11grab -r 30 -s 1280x720 -i :99 \
    -f alsa -ac 2 -i default \
    -vcodec libx264 -acodec aac -ab 50k \
    -pix_fmt yuv420p \
    -preset ultrafast -b:v $V_BITRATE -b:a $A_BITRATE \
    -f flv rtmp://192.168.40.4/video1