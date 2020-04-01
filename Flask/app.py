import os
from api import create_app


app_settings_mode = os.getenv('APP_SETTINGS')
application = create_app(app_settings_mode)


if __name__ == '__main__':
    application.run(host='0.0.0.0', port=80)
