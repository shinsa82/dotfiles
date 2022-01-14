# セットアップ手順

- `git --version` を実行すると XCode のインストールを促されるので入れる。
もしくはいきなり `xcode-select --install`

- Install from Mac@IBM
  - Box Sync, Box Notes and Box Edit
  - MS Office
  - Slack
  - ILC
- Install Chrome
- Install Google IME
- Install Adobe Reader
- setup RoboForm
- setup Box
- Install Skitch (for screen capturing)

## Develop environment

- change host name using GUI and scutil
- ssh setting using sshfiles.zip on Box
- setup shell using bashprofile on Box
- check if git works
- install homebrew (run an one-liner from brew home page)
  - install coreutils (for newer version of ls)
  - install grep, make with default names (--with-default-names)
  - install jq, gzip
- install vscode
  - install extension: Go
- install anyenv (see below)
  - install nodenv
  - install goenv
  - install pyenv
- install docker from .dmg file
  - configure command completion
  - configure resource limit settings (CPU, memory, ...)

## For Blockchain development

- [not yet] Download platform binaries
- Download Fabric docker images 

## Anyenv

### インストール

概ね公式ドキュメント通り。

```shell
cd ~
rm -rf ~/.anyenv ~/.config/anyenv
git clone https://github.com/anyenv/anyenv ~/.anyenv
<add ~/.anyenv/bin to PATH in .bash_profile>
<add "anyenv init -" to .bash_profile and restart shell>
anyenv install --init
```

### プラグイン

更新系のプラグイン。たぶん、`anyenv-update` はインストールできるランタイムのバージョンリストを update できる。`anyenv-git` は各 *env やプラグインを update できる？

```shell
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
```
使い方

```shell
anyenv update  # anyenv と プラグインを更新
anyenv git pull # 各バージョンの取得
anyenv git gc # 領域の整理
```

### *env のインストール

```shell
anyenv install pyenv
anyenv install nodenv
```

特に `.bashrc` などの書き換えはいらない (`anyenv init -` が自動でやってくれるので)。

```shell
pyenv install <version> 
# など
```

ここでビルドに失敗する場合は XCode のインストールまたは更新が必要で、さらに Command Line Tools のインストールが必要である。
コマンドラインからもインストールできるらしい。
https://qiita.com/katafuchix/items/95abcf3a6e451a80aff4
https://stangler.hatenablog.com/entry/2019/01/29/154017

### pyenv-virtualenv のインストール

```shell
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
<add eval "$(pyenv virtualenv-init -)" to .bash_profile>
```

## K8s and OpenShift

### K8s

Docker のインストールは済んでいるものとする。

#### kubectrl

Docker を入れると `kubectl` がすでに入っている。`/usr/local/bin/kubectl` と `/usr/local/bin/kubectl.docker` から同じファイルに symlink されている。

```shell
[16:31:15 ~/git]$ ll /usr/local/bin/k*
lrwxr-xr-x 1 shinsa staff 55  2 14  2019 /usr/local/bin/kubectl -> /Applications/Docker.app/Contents/Resources/bin/kubectl*
lrwxr-xr-x 1 shinsa staff 55  2 14  2019 /usr/local/bin/kubectl.docker -> /Applications/Docker.app/Contents/Resources/bin/kubectl*
```

バージョンがちょっと古いので brew で入れ直してリンクを張り直す

```shell
brew install kubectl
brew link --overwrite kubernetes-cli # kubectl Formula の正式名称らしい
```

これでシンボリックリンクが更新された。もとに戻したいときは `kubectl.docker` から戻せばいい。

```shell
[16:49:55 ~/git]$ kubectl version
Client Version: version.Info{Major:"1", Minor:"20", GitVersion:"v1.20.4", GitCommit:"e87da0bd6e03ec3fea7933c4b5263d151aafd07c", GitTreeState:"clean", BuildDate:"2021-02-21T20:23:45Z", GoVersion:"go1.15.8", Compiler:"gc", Platform:"darwin/amd64"}
The connection to the server localhost:8080 was refused - did you specify the right host or port?

[17:24:53 ~/git]$ kubectl cluster-info

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
The connection to the server localhost:8080 was refused - did you specify the right host or port?
```

シェル補完ファイルは自動的にインストールされる。

#### Minikube

`minikube` はホストマシン上にシングルノードの K8s クラスタを作成してくれるツール。

```shell
brew install minikube
```

これも自動的に補完をインストールしてくれる。

```shell
[19:09:43 ~]$ minikube version
minikube version: v1.18.1
commit: 09ee84d530de4a92f00f1c5dbc34cead092b95bc
```

minikube 関連のデータは `~/.minikube` に入っている。

brew で入れるとサーバサイドは v1.20.2 が入るようだ (クライアントは v1.20.4 が入っている)

```shell
[19:09:48 ~]$ minikube start
* Darwin 11.2.1 上の minikube v1.18.1
* dockerドライバーが自動的に選択されました。他の選択肢:  hyperkit, virtualbox, ssh
* コントロールプレーンのノード minikube を minikube 上で起動しています
* Pulling base image ...
* Kubernetes v1.20.2 のダウンロードの準備をしています
    > preloaded-images-k8s-v9-v1....: 367.67 MiB / 491.22 MiB  74.85% 1.97 MiB
* docker container (CPUs=2, Memory=4000MB) を作成しています...
    > kubectl.sha256: 64 B / 64 B [--------------------------] 100.00% ? p/s 0s
    > kubelet.sha256: 64 B / 64 B [--------------------------] 100.00% ? p/s 0s
    > kubeadm.sha256: 64 B / 64 B [--------------------------] 100.00% ? p/s 0s
    > kubeadm: 37.40 MiB / 37.40 MiB [---------------] 100.00% 1.66 MiB p/s 22s
    > kubectl: 38.37 MiB / 38.37 MiB [---------------] 100.00% 1.55 MiB p/s 25s
    > kubelet: 108.73 MiB / 108.73 MiB [-------------] 100.00% 2.34 MiB p/s 46s

  - Generating certificates and keys ...
  - Booting up control plane ...
  - Configuring RBAC rules ...
* Kubernetes コンポーネントを検証しています...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v4
* 有効なアドオン: storage-provisioner, default-storageclass
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

[19:21:09 ~]$ kubectl version
Client Version: version.Info{Major:"1", Minor:"20", GitVersion:"v1.20.4", GitCommit:"e87da0bd6e03ec3fea7933c4b5263d151aafd07c", GitTreeState:"clean", BuildDate:"2021-02-21T20:23:45Z", GoVersion:"go1.15.8", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"20", GitVersion:"v1.20.2", GitCommit:"faecb196815e248d3ecfb03c680a4507229c2a56", GitTreeState:"clean", BuildDate:"2021-01-13T13:20:00Z", GoVersion:"go1.15.5", Compiler:"gc", Platform:"linux/amd64"}

[19:33:16 ~]$ kubectl get nodes
NAME       STATUS   ROLES                  AGE   VERSION
minikube   Ready    control-plane,master   12m   v1.20.2

[19:36:53 ~]$ kubectl get pods -A
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
kube-system   coredns-74ff55c5b-h9gmv            1/1     Running   0          15m
kube-system   etcd-minikube                      1/1     Running   0          15m
kube-system   kube-apiserver-minikube            1/1     Running   0          15m
kube-system   kube-controller-manager-minikube   1/1     Running   0          15m
kube-system   kube-proxy-kb9qb                   1/1     Running   0          15m
kube-system   kube-scheduler-minikube            1/1     Running   0          15m
kube-system   storage-provisioner                1/1     Running   1          15m
```

などなど。minikube と K8s のチュートリアルが詳しいし有用。
