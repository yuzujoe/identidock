FROM python:3.7

# uwsgiというユーザーとグループの作成
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==0.10.1 uWSGI==2.0.18
WORKDIR /app
COPY app /app
COPY cmd.sh /

# EXPOSE命令を使って、ホストや他のコンテナからアクセスできるポートの宣言
EXPOSE 9090 9191
# 実行ユーザーをuwsgiに渡す
USER uwsgi

CMD ["/cmd.sh"]
