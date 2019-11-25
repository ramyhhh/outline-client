# check FILE EXIST release.key IF NOT call key-tool
# keytool -genkey -v -keystore <keystoreName>.keystore -alias <Keystore AliasName> -keyalg <Key algorithm> -keysize <Key size> -validity <Key Validity in Days>
# keytool -genkey -v -keystore NAME-mobileapps.keystore -alias NAMEmobileapps -keyalg RSA -keysize 2048 -validity 10000

# after this it will say something about cert type being propiatry and can be converted to other type

STORE_PASSWORD=
while [ -z $STORE_PASSWORD ]
do
    echo "Enter key store password:"
  read STORE_PASSWORD
done

KEY_ALIAS=
while [ -z $KEY_ALIAS ]
do
    echo "Enter key alias:"
  read KEY_ALIAS
done

KEY_PASSWORD=
while [ -z $KEY_PASSWORD ]
do
    echo "Enter key password:"
  read KEY_PASSWORD
done

./node_modules/cordova/bin/cordova compile android --release -- --keystore=./release.key --storePassword=$STORE_PASSWORD --alias=$KEY_ALIAS --password=$KEY_PASSWORD 

#it's better to use the default gulp command to make sure of clean build and pass build params to generate x86, arm apks
