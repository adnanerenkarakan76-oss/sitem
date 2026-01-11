    'video_bg': 'https://assets.mixkit.co/videos/preview/mixkit-abstract-fast-motion-of-light-colors-34371-large.mp4',
    'admin_pass': 'admin123',
    'visits': 0
}

@app.route('/')
def home():
    site_data['visits'] += 1
    return render_template_string("""
    <html><head><style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family: sans-serif; color: white; background: #000; }
        #vbg { position: fixed; right: 0; bottom: 0; min-width: 100%; min-height: 100%; z-index: -1; object-fit: cover; filter: brightness(0.6); }
        .content { display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100vh; text-align: center; }
        h1 { font-size: 2.5em; text-shadow: 0 0 10px #000; }
        .btn { margin-top: 20px; padding: 12px 30px; background: linear-gradient(45deg, #f09433, #bc1888); color: white; text-decoration: none; border-radius: 25px; }
    </style></head>
    <body onclick="document.getElementById('m').play()">
        <video key="{{d.video_bg}}" autoplay muted loop playsinline id="vbg">
            <source src="{{d.video_bg}}" type="video/mp4">
        </video>
        <div class="content">
            <h1>{{d.title}}</h1><p>{{d.subtitle}}</p>
            <a href="{{d.insta_url}}" class="btn" target="_blank">Instagram</a>
            <p style="margin-top:20px; color:#0f0;">Visitors: {{d.visits}}</p>
        </div>
        <audio id='m' loop src='https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'></audio>
    </body></html>""", d=site_data)

@app.route('/admin', methods=['GET', 'POST'])
def admin():
    if request.method == 'POST':
        if request.form.get('p') == site_data['admin_pass']:
            session['logged_in'] = True
            site_data['title'] = request.form.get('t')
            site_data['subtitle'] = request.form.get('s')
            site_data['insta_url'] = request.form.get('i')
            site_data['video_bg'] = request.form.get('v')
            return redirect('/admin')
        return "Sifre Yanlis!"
    if not session.get('logged_in'):
        return "<form method='POST'>Password: <input type='password' name='p'><button>Login</button></form>"
    return render_template_string("""
    <body style='background:#222; color:#fff; padding:20px;'>
        <h2>Admin Panel</h2>
        <form method='POST'>
            Verify PW: <input type='password' name='p'><br><br>
            Title: <input name='t' value='{{d.title}}'><br>
            Sub: <input name='s' value='{{d.subtitle}}'><br>
            Insta: <input name='i' value='{{d.insta_url}}'><br>
            Video MP4: <input name='v' value='{{d.video_bg}}' style='width:80%'><br><br>
            <button>UPDATE SITE</button>
        </form>
    </body>""", d=site_data)

if __name__ == '__main__':
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(('', 0))
    port = s.getsockname()[1]
    s.close()
    print(f"PORT: {port}")
    app.run(host='0.0.0.0', port=port)
EOF

python app.py
cloudflared tunnel --url http://127.0.0.1:8082
cloudflared tunnel --url http://127.0.0.1:53779
cloudflared tunnel --url http://127.0.0.1:51909
pkg update && pkg upgrade
mkdir sitem
cd sitem
echo "<?php echo 'Merhaba Dunya! Bu site Termux uzerinden calisiyor.'; ?>" > index.php
php -S localhost:8080
ssh -R 80:localhost:8080 localhost.run
php -t . -S localhost:8080
TMPDIR=$PİD php -S 0.0.0.0:8080
export TMPDIR=$PREFIX/tmp
php -S localhost:8080
chmod +rw .
php -S 127.0.0.1:8080
python -m http.server 8080
cloudflared tunnel --url http://127.0.0.1:8083
killall python
echo "from flask import Flask, render_template_string, request, redirect
app = Flask(__name__)
site_data = {'title': 'Satisfy Experiments', 'subtitle': 'Global Hub', 'insta_url': 'https://instagram.com/satisfy.experiments', 'music_url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', 'visits': 0}

@app.route('/')
def home():
    site_data['visits'] += 1
    return render_template_string('''
    <body style='background:#000;color:#fff;text-align:center;font-family:sans-serif;padding:50px;'>
        <h1>{{data.title}}</h1><p>{{data.subtitle}}</p>
        <a href='{{data.insta_url}}' style='background:linear-gradient(45deg,#f09433,#bc1888);color:white;padding:15px;text-decoration:none;border-radius:30px;'>Instagram</a>
        <p style='color:#0f0'>Visitors: {{data.visits}}</p>
        <audio id='m' loop><source src='{{data.music_url}}'></audio>
        <script>document.body.onclick=()=>document.getElementById('m').play()</script>
    </body>''', data=site_data)

@app.route('/admin', methods=['GET', 'POST'])
def admin():
    if request.method == 'POST':
        site_data.update({'title':request.form['t'],'subtitle':request.form['s'],'insta_url':request.form['i'],'music_url':request.form['m']})
        return redirect('/admin')
    return render_template_string('''
    <body style='background:#222;color:#fff;padding:20px;font-family:sans-serif;'>
        <h2>⚙️ Admin Panel</h2>
        <form method='POST'>
            Title: <input name='t' value='{{data.title}}'><br><br>
            Subtitle: <input name='s' value='{{data.subtitle}}'><br><br>
            Insta: <input name='i' value='{{data.insta_url}}'><br><br>
            Music: <input name='m' value='{{data.music_url}}'><br><br>
            <button type='submit'>GÜNCELLE</button>
        </form>
    </body>''', data=site_data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8083)" > app.py && python app.py
fuser -k 8083/tcp
import socket
from flask import Flask, render_template_string, request, redirect
app = Flask(__name__)
site_data = {'title': 'Satisfy Experiments', 'subtitle': 'Global Hub', 'insta_url': 'https://instagram.com/satisfy.experiments', 'music_url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', 'visits': 0}
@app.route('/')
def home():
@app.route('/admin', methods=['GET', 'POST'])
def admin():
if __name__ == '__main__':
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
cat > app.py
python app.py
fuser -k 8081/tcp
pkill cloudflared
python app.py
cloudflared tunnel --url http://127.0.0.1:8081
echo "from flask import Flask
app = Flask(__name__)
@app.route('/')
def home():
    return '''
    <html>
        <head><title>Global Project</title></head>
        <body style='font-family:sans-serif; text-align:center; background:#111; color:#eee; padding:100px;'>
            <h1 style='color:#00d4ff;'>🌍 Global Project Active</h1>
            <p style='font-size:1.2em;'>Live from Termux via Cloudflare.</p>
            <div style='border:1px solid #333; display:inline-block; padding:10px; border-radius:10px;'>
                Port: 8082 | Status: <span style='color:#00ff00;'>ONLINE</span>
            </div>
        </body>
    </html>
    '''
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8082)" > app.py && python app.py
echo "from flask import Flask
app = Flask(__name__)
@app.route('/')
def home():
    return '''
    <html>
        <head>
            <title>Satisfy Experiments | Global</title>
            <meta name='viewport' content='width=device-width, initial-scale=1'>
            <style>
                body { font-family: 'Segoe UI', sans-serif; text-align: center; background: #000; color: #fff; padding: 50px 20px; margin: 0; }
                .container { max-width: 600px; margin: auto; border: 1px solid #333; padding: 30px; border-radius: 20px; background: #111; }
                h1 { color: #00d4ff; font-size: 2em; margin-bottom: 10px; }
                p { color: #888; margin-bottom: 30px; }
                .btn-insta {
                    display: inline-block;
                    background: linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%);
                    color: white;
                    padding: 15px 30px;
                    text-decoration: none;
                    border-radius: 50px;
                    font-weight: bold;
                    font-size: 1.1em;
                    transition: transform 0.3s;
                }
                .btn-insta:hover { transform: scale(1.05); }
                .status { margin-top: 30px; font-size: 0.8em; color: #444; }
                .online { color: #00ff00; }
            </style>
        </head>
        <body>
            <div class='container'>
                <h1>✨ Satisfy Experiments</h1>
                <p>Welcome to my global hub. Experience the most satisfying content on the web.</p>
                
                <a href='https://www.instagram.com/satisfy.experiments?igsh=eHpwc3FzMXl1b2lr' class='btn-insta' target='_blank'>
                    Follow on Instagram
                </a>

                <div class='status'>
                    Server Location: <span class='online'>Termux Mobile</span><br>
                    Global Reach: <span class='online'>Active</span>
                </div>
            </div>
        </body>
    </html>
    '''
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8082)" > app.py && python app.py
echo "from flask import Flask
app = Flask(__name__)
# Basit bir ziyaretçi sayacı (Sunucu açık kaldığı sürece sayar)
v_count = 0

@app.route('/')
def home():
    global v_count
    v_count += 1
    return f'''
    <html>
        <head>
            <title>Satisfy Experiments | Global</title>
            <meta name='viewport' content='width=device-width, initial-scale=1'>
            <style>
                body {{ font-family: 'Segoe UI', sans-serif; text-align: center; background: #000; color: #fff; padding: 50px 20px; margin: 0; }}
                .container {{ max-width: 600px; margin: auto; border: 1px solid #333; padding: 30px; border-radius: 20px; background: #111; box-shadow: 0 0 20px rgba(0,212,255,0.2); }}
                h1 {{ color: #00d4ff; font-size: 2.2em; }}
                .btn-insta {{
                    display: inline-block;
                    background: linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%);
                    color: white; padding: 15px 35px; text-decoration: none; border-radius: 50px; font-weight: bold; margin: 20px 0; transition: 0.3s;
                }}
                .counter {{ font-size: 1.2em; color: #00ff00; margin-top: 20px; font-family: monospace; }}
                .music-player {{ margin-top: 20px; padding: 10px; background: #222; border-radius: 10px; }}
            </style>
        </head>
        <body>
            <div class='container'>
                <h1>✨ Satisfy Experiments</h1>
                <p>Global Hub for Satisfying Content</p>
                
                <a href='https://www.instagram.com/satisfy.experiments?igsh=eHpwc3FzMXl1b2lr' class='btn-insta' target='_blank'>
                    Follow on Instagram
                </a>

                <div class='music-player'>
                    <p style='font-size: 0.8em; color: #888;'>🎵 Background Music</p>
                    <audio controls loop style='width: 100%; height: 30px;'>
                        <source src='https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3' type='audio/mpeg'>
                        Your browser does not support the audio element.
                    </audio>
                </div>

                <div class='counter'>
                    Total Global Visits: {v_count}
                </div>
                
                <p style='font-size: 0.7em; color: #444; margin-top: 20px;'>Live from Termux Hub</p>
            </div>
        </body>
    </html>
    '''
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8082)" > app.py && python app.py
echo "from flask import Flask
app = Flask(__name__)
v_count = 0

@app.route('/')
def home():
    global v_count
    v_count += 1
    return f'''
    <html>
        <head>
            <title>Satisfy Experiments | Global</title>
            <meta name='viewport' content='width=device-width, initial-scale=1'>
            <style>
                body {{ font-family: 'Segoe UI', sans-serif; text-align: center; background: #000; color: #fff; padding: 50px 20px; margin: 0; }}
                .container {{ max-width: 600px; margin: auto; border: 1px solid #333; padding: 30px; border-radius: 20px; background: #111; box-shadow: 0 0 20px rgba(0,212,255,0.2); }}
                h1 {{ color: #00d4ff; font-size: 2.2em; }}
                .btn-insta {{
                    display: inline-block;
                    background: linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%);
                    color: white; padding: 15px 35px; text-decoration: none; border-radius: 50px; font-weight: bold; margin: 20px 0; transition: 0.3s;
                }}
                .counter {{ font-size: 1.2em; color: #00ff00; margin-top: 20px; font-family: monospace; }}
                /* Ses oynatıcıyı tamamen gizledik */
                #bg-music {{ display: none; }}
            </style>
        </head>
        <body onclick='document.getElementById(\"bg-music\").play()'>
            <div class='container'>
                <h1>✨ Satisfy Experiments</h1>
                <p>Global Hub for Satisfying Content</p>
                <p style='font-size: 0.7em; color: #555;'>(Tap anywhere to enable sound)</p>
                
                <a href='https://www.instagram.com/satisfy.experiments?igsh=eHpwc3FzMXl1b2lr' class='btn-insta' target='_blank'>
                    Follow on Instagram
                </a>

                <div class='counter'>
                    Total Global Visits: {v_count}
                </div>
                
                <p style='font-size: 0.7em; color: #444; margin-top: 20px;'>Live from Termux Hub</p>

                <audio id='bg-music' loop autoplay>
                    <source src='https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3' type='audio/mpeg'>
                </audio>
            </div>

            <script>
                // Sayfaya herhangi bir yere tıklandığında müzik başlar (Tarayıcı engelini aşmak için)
                window.addEventListener('click', function() {{
                    var audio = document.getElementById('bg-music');
                    audio.play();
                }});
            </script>
        </body>
    </html>
    '''
if __name__ == '__main__':
    app.run(host='0.0.0.0', port

echo "from flask import Flask
app = Flask(__name__)
v_count = 0

@app.route('/')
def home():
    global v_count
    v_count += 1
    return f'''
    <html>
        <head>
            <title>Satisfy Experiments | Global</title>
            <meta name='viewport' content='width=device-width, initial-scale=1'>
            <style>
                body {{ font-family: 'Segoe UI', sans-serif; text-align: center; background: #000; color: #fff; padding: 50px 20px; margin: 0; }}
                .container {{ max-width: 600px; margin: auto; border: 1px solid #333; padding: 30px; border-radius: 20px; background: #111; box-shadow: 0 0 20px rgba(0,212,255,0.2); }}
                h1 {{ color: #00d4ff; font-size: 2.2em; }}
                .btn-insta {{
                    display: inline-block;
                    background: linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%);
                    color: white; padding: 15px 35px; text-decoration: none; border-radius: 50px; font-weight: bold; margin: 20px 0; transition: 0.3s;
                }}
                .counter {{ font-size: 1.2em; color: #00ff00; margin-top: 20px; font-family: monospace; }}
                /* Ses oynatıcıyı tamamen gizledik */
                #bg-music {{ display: none; }}
            </style>
        </head>
        <body onclick='document.getElementById(\"bg-music\").play()'>
            <div class='container'>
                <h1>✨ Satisfy Experiments</h1>
                <p>Global Hub for Satisfying Content</p>
                <p style='font-size: 0.7em; color: #555;'>(Tap anywhere to enable sound)</p>
                
                <a href='https://www.instagram.com/satisfy.experiments?igsh=eHpwc3FzMXl1b2lr' class='btn-insta' target='_blank'>
                    Follow on Instagram
                </a>

                <div class='counter'>
                    Total Global Visits: {v_count}
                </div>
                
                <p style='font-size: 0.7em; color: #444; margin-top: 20px;'>Live from Termux Hub</p>

                <audio id='bg-music' loop autoplay>
                    <source src='https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3' type='audio/mpeg'>
                </audio>
            </div>

            <script>
                // Sayfaya herhangi bir yere tıklandığında müzik başlar (Tarayıcı engelini aşmak için)
                window.addEventListener('click', function() {{
                    var audio = document.getElementById('bg-music');
                    audio.play();
                }});
            </script>
        </body>
    </html>
    '''
if __name__ == '__main__':
    app.run(host='0.0.0.0', port

echo "from flask import Flask
app = Flask(__name__)
v_count = 0

@app.route('/')
def home():
    global v_count
    v_count += 1
    return f'''
    <html>
        <head>
            <title>Satisfy Experiments | Global</title>
            <meta name='viewport' content='width=device-width, initial-scale=1'>
            <style>
                body {{ font-family: 'Segoe UI', sans-serif; text-align: center; background: #000; color: #fff; padding: 50px 20px; margin: 0; overflow: hidden; }}
                .container {{ max-width: 600px; margin: auto; border: 1px solid #333; padding: 30px; border-radius: 20px; background: #111; box-shadow: 0 0 20px rgba(0,212,255,0.2); position: relative; z-index: 2; }}
                h1 {{ color: #00d4ff; font-size: 2.2em; }}
                .btn-insta {{
                    display: inline-block;
                    background: linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%);
                    color: white; padding: 15px 35px; text-decoration: none; border-radius: 50px; font-weight: bold; margin: 20px 0; transition: 0.3s;
                }}
                .counter {{ font-size: 1.2em; color: #00ff00; margin-top: 20px; font-family: monospace; }}
                #bg-music {{ display: none; }}
            </style>
        </head>
        <body onclick='document.getElementById(\"bg-music\").play()'>
            <div class='container'>
                <h1>✨ Satisfy Experiments</h1>
                <p>Global Hub for Satisfying Content</p>
                <p style='font-size: 0.8em; color: #00d4ff;'>🎵 Music is playing (Tap to start) 🎵</p>
                
                <a href='https://www.instagram.com/satisfy.experiments?igsh=eHpwc3FzMXl1b2lr' class='btn-insta' target='_blank'>
                    Follow on Instagram
                </a>

                <div class='counter'>
                    Total Global Visits: {v_count}
                </div>
                
                <p style='font-size: 0.7em; color: #444; margin-top: 20px;'>Live from Termux Hub</p>

                <audio id='bg-music' loop>
                    <source src='https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3' type='audio/mpeg'>
                </audio>
            </div>
        </body>
    </html>
    '''
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8082)" > app.py && python app.py
echo "from flask import Flask
app = Flask(__name__)
v_count = 0

@app.route('/')
def home():
    global v_count
    v_count += 1
    return f'''
    <html>
        <head>
            <title>Satisfy Experiments | Global</title>
            <meta name='viewport' content='width=device-width, initial-scale=1'>
            <style>
                body {{ font-family: 'Segoe UI', sans-serif; text-align: center; background: #000; color: #fff; padding: 50px 20px; margin: 0; }}
                .container {{ max-width: 600px; margin: auto; border: 1px solid #333; padding: 30px; border-radius: 20px; background: #111; box-shadow: 0 0 30px rgba(0,212,255,0.3); }}
                h1 {{ color: #00d4ff; font-size: 2.2em; text-shadow: 0 0 10px #00d4ff; }}
                .btn-insta {{
                    display: inline-block;
                    background: linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%);
                    color: white; padding: 15px 35px; text-decoration: none; border-radius: 50px; font-weight: bold; margin: 20px 0; transition: 0.3s;
                }}
                .counter {{ font-size: 1.2em; color: #00ff00; margin-top: 20px; font-family: monospace; }}
            </style>
        </head>
        <body>
            <div class='container'>
                <h1>✨ Satisfy Experiments</h1>
                <p>Global Content Hub</p>
                
                <a href='https://www.instagram.com/satisfy.experiments?igsh=eHpwc3FzMXl1b2lr' class='btn-insta' target='_blank'>
                    Follow on Instagram
                </a>

                <div class='counter'>
                    Visitors: {v_count}
                </div>
                
                <p style='font-size: 0.8em; color: #555; margin-top: 20px;'>Running on Mobile Termux Server</p>

                <iframe src='https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3' allow='autoplay' style='display:none' id='iframeAudio'></iframe>
                
                <audio id='bg-music' loop autoplay playsinline>
                    <source src='https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3' type='audio/mpeg'>
                </audio>
            </div>

            <script>
                // Bazı tarayıcılar için yedek zorlama
                document.addEventListener('DOMContentLoaded', function() {{
                    var audio = document.getElementById('bg-music');
                    audio.play().catch(function(error) {{
                        console.log('Otomatik oynatma engellendi, etkileşim bekleniyor.');
                    }});
                }});
            </script>
        </body>
    </html>
    '''
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8082)" > app.py && python app.py
rm index.html
nano index.html
git add . && git commit -m "ops center v2: ses ve panel eklendi" && git push origin main
rm index.html
nano index.html
git add . && git commit -m "sadrazam v3: tam hacker deneyimi" && git push origin main
rm index.html
nano indwx.html
git add . && git commit -m "sadrazam v3: tam hacker deneyimi" && git push origin main 
