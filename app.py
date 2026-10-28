import os
import subprocess
from flask import Flask, render_template, request, send_file

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/generar', methods=['POST'])
def generar():
    # 1. Recibir las notas desde el frontend
    notas = request.form.get('notas', '')
    
    # 2. Formatear la sintaxis válida de Bazilio
    codigo_bazilio = f'Main |:\n    (:) {{{notas}}}\n:|'
    
    ruta_bzl = 'programas/web_temp.bzl'
    ruta_mp3 = 'programas/web_temp.mp3'
    
    # 3. Guardar el archivo temporal
    with open(ruta_bzl, 'w', encoding='utf-8') as f:
        f.write(codigo_bazilio)
        
    # 4. Ejecutar tu intérprete (bazilio.py)
    subprocess.run(["python3", "bazilio.py", ruta_bzl])
    
    # 5. Enviar el MP3 generado de vuelta al navegador
    if os.path.exists(ruta_mp3):
        return send_file(ruta_mp3, mimetype='audio/mpeg')
    else:
        return "Error al compilar el audio", 500

@app.route('/descargar_pdf')
def descargar_pdf():
    ruta_pdf = 'programas/web_temp.pdf'
    if os.path.exists(ruta_pdf):
        # as_attachment=True fuerza la descarga en lugar de abrirlo en el navegador
        return send_file(ruta_pdf, as_attachment=True)
    else:
        return "Partitura no generada", 404
    
@app.after_request
def add_header(response):
    # Esto fuerza al navegador a nunca guardar en caché las respuestas del servidor
    response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, post-check=0, pre-check=0, max-age=0'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = '-1'
    return response

if __name__ == '__main__':
    app.run(debug=True, port=5000)