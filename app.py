import socket
from flask import Flask, render_template_string, request, redirect, session

app = Flask(__name__)
app.secret_key = "ozel_anahtar_123"

site_data = {
    'title': '✨ Satisfy Experiments', 
    'subtitle': 'Global Visual Experience', 
    'insta_url': 'https://instagram.com/satisfy.experiments', 
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
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=10000)

