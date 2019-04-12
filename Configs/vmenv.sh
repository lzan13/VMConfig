### set Android sdk path
export ANDROID_SDK="$HOME/Develop/Android/sdk"
export PATH=$ANDROID_SDK:$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools:$PATH

### set Android ndk path
export ANDROID_NDK="$HOME/Develop/Android/ndk"
export PATH=$ANDROID_NDK:$PATH

### set Flutter path
export FLUTTER="$HOME/Develop/Flutter"
export PATH=$FLUTTER/bin:$PATH

### set jadx path
export JADX="$HOME/Develop/Tools/jadx"
export PATH=$JADX/bin:$PATH

### nvm path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
