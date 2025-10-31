# 🔧 CORRECTION GOOGLE SIGN-IN - INSTRUCTIONS DÉTAILLÉES

## 📋 PROBLÈME IDENTIFIÉ
L'erreur `ApiException: 7` indique que votre fichier `google-services.json` ne contient pas les configurations OAuth nécessaires.

## 🎯 VOS FINGERPRINTS À AJOUTER
- **SHA-1** : `74:57:62:72:33:BD:40:1C:58:C1:E0:AD:D5:5A:45:30:24:18:71:5E`
- **SHA-256** : `38:3B:87:77:44:37:B1:69:7E:B9:CC:82:F9:AB:A8:96:C7:46:1F:5A:09:EA:19:9C:42:E8:1A:88:67:EF:F6:EA`

## 📱 ÉTAPES FIREBASE CONSOLE (DÉTAILLÉES)

### 1. Accès Firebase Console
- Allez sur : https://console.firebase.google.com
- Connectez-vous avec votre compte Google
- Sélectionnez le projet : `social-impact-mvp-prod-b6805`

### 2. Navigation vers les paramètres
- Cliquez sur l'icône ⚙️ **"Project Settings"** (en haut à gauche)
- Vous devriez être dans l'onglet **"General"**

### 3. Localisation de votre app Android
- Scrollez vers le bas jusqu'à la section **"Your apps"**
- Trouvez l'application avec :
  - Platform: Android
  - Package name: `com.example.social_impact_mvp`

### 4. Ajout des fingerprints SHA
- Dans la carte de votre app Android, cherchez la section **"SHA certificate fingerprints"**
- Cliquez sur **"Add fingerprint"**
- Collez le SHA-1 : `74:57:62:72:33:BD:40:1C:58:C1:E0:AD:D5:5A:45:30:24:18:71:5E`
- Cliquez **"Save"** ou **"Add"**
- Cliquez de nouveau sur **"Add fingerprint"**
- Collez le SHA-256 : `38:3B:87:77:44:37:B1:69:7E:B9:CC:82:F9:AB:A8:96:C7:46:1F:5A:09:EA:19:9C:42:E8:1A:88:67:EF:F6:EA`
- Cliquez **"Save"** ou **"Add"**

### 5. Téléchargement du nouveau fichier
- Après avoir ajouté les fingerprints, vous devriez voir un bouton **"google-services.json"** ou un icône de téléchargement
- Cliquez dessus pour télécharger le **nouveau** fichier
- Le fichier téléchargé doit être différent de l'ancien

### 6. Vérification du nouveau fichier
- Ouvrez le fichier téléchargé
- Vérifiez que la section `"oauth_client"` N'EST PLUS VIDE
- Elle doit contenir des objets avec `"client_id"` et `"client_type"`

### 7. Remplacement du fichier
- Remplacez `android/app/google-services.json` par le nouveau fichier
- Assurez-vous que le chemin est correct

## 🧪 TESTS APRÈS CORRECTION

```bash
flutter clean
flutter run
# Testez Google Sign-In dans l'app
```

## ❓ SI ÇA NE MARCHE TOUJOURS PAS

1. **Vérifiez que vous êtes sur le bon projet Firebase**
2. **Assurez-vous que le package name est correct** : `com.example.social_impact_mvp`
3. **Redémarrez complètement l'émulateur Android**
4. **Vérifiez que les Google Play Services sont installés sur l'émulateur**

## 📞 CONTACT
Si vous rencontrez des difficultés à une étape spécifique, indiquez-moi :
- À quelle étape exacte vous bloquez
- Ce que vous voyez à l'écran
- Capture d'écran si nécessaire
