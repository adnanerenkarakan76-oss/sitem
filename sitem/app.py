import socket
from flask import Flask, render_template_string, request, redirect

app = Flask(__name__)
site_data = {
    'title': 'Satisfy Experiments', 
    'subtitle': 'Global Hub', 
    'insta_url': 'https://instagram.com/satisfy.experiments', 
    'music_url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', 
    'visits': 0
}

@app.route('/')
def home():
    site_data['visits'] += 1
    return render_template_string("<body style='background:#000;color:#fff;text-align:center;padding:50px;'><h1>{{d.title}}</h1><p>{{d.subtitle}}</p><a href='{{d.insta_url}}' style='color:orange;'>Instagram</a><p>Visits: {{d.visits}}</p><audio id='m' loop src='{{d.music_url}}'></audio><script>document.body.onclick=()=>document.getElementById('m').play()</script></body>", d=site_data)

@app.route('/admin', methods=['GET', 'POST'])
def admin():
    if request.method == 'POST':
        site_data.update({'title':request.form['t'],'subtitle':request.form['s'],'insta_url':request.form['i'],'music_url':request.form['m']})
        return redirect('/admin')
    return render_template_string("<body style='background:#222;color:#fff;padding:20px;'><h2>Admin</h2><form method='POST'>T: <input name='t' value='{{d.title}}'><br>S: <input name='s' value='{{d.subtitle}}'><br>I: <input name='i' value='{{d.insta_url}}'><br>M: <input name='m' value='{{d.music_url}}'><br><button>Guncelle</button></form></body>", d=site_data)

if __name__ == '__main__':
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(('', 0))
    port = s.getsockname()[1]
    s.close()
    print(f"\n\n--- SİTE ŞU PORTTA AÇILDI: {port} ---\n\n")
    app.run(host='0.0.0.0', port=port)
