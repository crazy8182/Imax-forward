import os
import threading

from bot import Bot
from app import app as health_app


def run_health_server():
    """Keep a public HTTP endpoint alive for Koyeb health checks."""
    port = int(os.environ.get("PORT", "8000"))
    health_app.run(
        host="0.0.0.0",
        port=port,
        debug=False,
        use_reloader=False,
        threaded=True,
    )


if __name__ == "__main__":
    # Koyeb checks the configured HTTP port while the Telegram bot runs.
    threading.Thread(target=run_health_server, daemon=True, name="health-server").start()
    Bot().run()
