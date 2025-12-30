import http.server
import socketserver

class HTTPServer(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_my_headers()  # Korrigiere den Methodenaufruf
        super().end_headers()   # Verwende super() für eine verbesserte Lesbarkeit

    def send_my_headers(self):
        self.send_header("Access-Control-Allow-Origin", "*")  # Korrigiere Groß-/Kleinschreibung und Bindestriche
        self.send_header("Cross-Origin-Embedder-Policy", "require-corp")
        self.send_header("Cross-Origin-Opener-Policy", "same-origin")  # Korrigiere Tippfehler in "same-origin"

if __name__ == "__main__":
    PORT = 8000  # Definiere einen Port für den Server
    Handler = HTTPServer  # Verwende den korrekten Handler
    with socketserver.TCPServer(("", PORT), Handler) as httpd:  # Verwende TCPServer zur Verbindung
        print(f"Serving at port {PORT}")
        httpd.serve_forever()
