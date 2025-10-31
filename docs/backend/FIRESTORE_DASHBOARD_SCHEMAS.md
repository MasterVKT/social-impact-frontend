# Firestore – Schémas Dashboard (MVP)

Ce document définit les schémas minimaux utilisés par la page Dashboard (notifications, activités, projets, statistiques utilisateur) et les index requis.

## Collections et champs

### users/{userId}
- firstName: string
- profilePicture: string|null (URL)
- userType: string ('contributor'|'project_creator'|'auditor'|'admin')

Accès: l’utilisateur connecté peut lire/écrire son propre document.

### notifications/{notifId}
- userId: string (UID destinataire)
- type: string (ex: 'project_update'|'milestone'|'payment')
- title: string
- body: string
- read: bool
- createdAt: timestamp

Index: userId ASC, createdAt DESC (pagination par destinataire).
Sécurité: lecture/écriture uniquement par le destinataire; création autorisée si request.auth.uid == request.resource.data.userId.

### activities/{activityId}
- userId: string (UID concerné)
- kind: string (ex: 'contribution'|'project_published'|'milestone_validated')
- entityId: string (id entité)
- entityType: string ('project'|'contribution')
- meta: map (attributs contextuels optionnels)
- createdAt: timestamp

Index: userId ASC, createdAt DESC.
Sécurité: lecture/écriture seulement pour l’utilisateur concerné; création idem.

### projects/{projectId}
- title: string
- shortDescription: string
- category: string (enum MVP)
- coverImageUrl: string
- raisedAmount: number
- targetAmount: number
- createdAt: timestamp
- ownerId (ou creatorId): string
- status: string (ex: 'draft'|'published'|'archived')

Index: status ASC, createdAt DESC (liste/pagination par statut).
Sécurité: lecture pour utilisateurs authentifiés; écriture par le créateur.

### user_stats/{userId}
- totalContributions: number
- totalAmountContributed: number
- projectsSupported: number
- activeProjects: number
- projectsCreated: number (si project_creator)
- totalRaised: number (si project_creator)
- userType: string

Source: calcul par Cloud Functions ou agrégation périodique. Lecture par l’utilisateur.

## Index requis
- collectionGroup: projects — status ASC, createdAt DESC
- collectionGroup: activities — userId ASC, createdAt DESC
- collectionGroup: notifications — userId ASC, createdAt DESC

## Bonnes pratiques
- Toujours paginer (limit, startAfter).
- Écrire createdAt côté serveur (FieldValue.serverTimestamp()).
- Valider les types côté client et via règles (si possible) pour réduire les erreurs.
- Prévoir migration si renommage ownerId/creatorId.
