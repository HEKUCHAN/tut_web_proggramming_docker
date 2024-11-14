# 東京工科大学 Webプログラミング（後期） Docker環境

MacOSユーザーが、学校の資料にある手順で授業を受けられるようにDocker環境を作成しました。
私の個人的な設定が多いので、問題があれば Issue を作って送ってください。
Windowsユーザーでも、環境が簡単に消去できるので、おすすめです。

CGIとSSIは設定済です。

## 基本的な使い方

### 授業用フォルダー作成
makeコマンドを使って、授業用のフォルダーを作成します。

```bash
make new-class --template
# または、直接シェルファイルを実行することでもできます。
./scripts/new_class.sh --template
```

そうするとプロジェクト直下に`class-01`フォルダーが作成されます。
```
drwxr-xr-x hekuta hekuta 4.0 KB Fri Nov 15 00:22:10 2024 class-01 <- これ
.rw-r--r-- hekuta hekuta 1.0 KB Thu Nov 14 22:15:57 2024 LICENSE
.rw-r--r-- hekuta hekuta 214 B  Thu Nov 14 23:31:20 2024 Makefile
.rw-r--r-- hekuta hekuta 714 B  Fri Nov 15 00:23:12 2024 README.md
drwxr-xr-x hekuta hekuta 4.0 KB Thu Nov 14 22:33:14 2024 scripts
drwxr-xr-x hekuta hekuta 4.0 KB Thu Nov 14 23:27:18 2024 template
```

### 授業用フォルダーに移動

```bash
cd class-01
```

### docker compose 起動

```bash
# in /class-01
docker compose up

# または、用意してるMakefile
make docker-run
```

### docker containerにアクセス
```bash
# in /class-01
docker exec -it apache_server bash

# または、用意してるMakefile
make docker-exec
```
