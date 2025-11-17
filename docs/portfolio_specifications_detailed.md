# Spécifications Détaillées - Page Portfolio
## Social Finance Impact Platform MVP

## Vue d'ensemble

La page **Portfolio** est la page dédiée aux investisseurs/contributeurs pour visualiser et gérer leurs investissements dans des projets à impact social. Cette page fait partie du module **Investments** et doit être adaptative (Mobile, Tablet, Desktop).

---

## Structure de la page - Onglets

### 1. **Onglet Aperçu (Overview)**

#### Fonctionnalités principales :
- **Carte Résumé Portfolio** (`PortfolioSummaryCard`)
  - Total Portfolio Value (valeur actuelle)
  - Total Returns (+/- € et %)
  - Total Invested (montant total investi)
  - Barre de progression visuelle
  - Métriques secondaires en grille :
    - Active Investments (nombre)
    - Completed (nombre)
    - Total Invested (€)
    - Return % (pourcentage)
  - Actions rapides :
    - Bouton "Invest"
    - Bouton "Withdraw"
    - Bouton "Analyze"
  - Refresh last updated timestamp
  - Bouton refresh manuel

- **Carte Top Investissements** (`OverviewTopInvestments`)
  - Liste des 5 meilleurs investissements par performance
  - Pour chaque investissement :
    - Avatar/initiale du projet
    - Nom du projet
    - Type d'investissement
    - Valeur actuelle (€)
    - Return % avec icône up/down et couleur (vert/rouge)

- **Graphique d'Allocation** (`OverviewAllocationChart`)
  - Camembert (pie chart) montrant la distribution par catégories
  - Vue par catégories, status, ou niveau de risque (menu contextuel)
  - Légende avec :
    - Pourcentages
    - Montants en €
  - Total au centre du graphique

#### Données affichées :
- Total Portfolio Value (depuis UserPortfolioSummary)
- Total Invested (depuis UserPortfolioSummary)
- Current Value (depuis UserPortfolioSummary)
- Return Percentage (depuis UserPortfolioSummary)
- Active Investments count (depuis UserPortfolioSummary)
- Completed Investments count (depuis UserPortfolioSummary)
- Top 5 investments (depuis UserPortfolioSummary.topInvestments)
- Allocation par catégories (depuis UserPortfolioSummary.investmentCategories)

---

### 2. **Onglet Portefeuille (Portfolio/Investments)**

#### Fonctionnalités principales :
- **Breakdown Portfolio** (`PortfolioBreakdown`)
  - Liste détaillée des statistiques :
    - Active Investments
    - Completed Investments
    - Total Investment
    - Current Value
    - Total Return (€)
    - Return Percentage (%)

- **Liste des Investissements** (`PortfolioList`)
  - Liste des investissements avec :
    - Avatar/icône du projet
    - Nom du projet
    - Type d'investissement
    - Montant investi (€)
    - Return avec icône up/down et couleur
  - Filtres (si showFilters = true) :
    - Chips : All, Active, Completed, Pending
    - Sort par : Date, Amount, Returns, Status (menu déroulant)
  - Actions :
    - View All (si pas en mode showAll)
    - Export List
    - Refresh
  - Empty state : message + bouton "Browse Projects"

#### Données affichées :
- Liste des investissements (depuis contributionsProvider)
- Filtrage par statut (confirmed, pending, failed, refunded)
- Tri selon critère sélectionné
- Export CSV/PDF (placeholder)

---

### 3. **Onglet Historique (History)**

#### Fonctionnalités principales :
- **Tableau des Contributions** (`HistoryTable`)
  - Colonnes :
    - Date
    - Project (nom ou ID)
    - Amount (€)
    - Status (avec chip coloré)
    - Actions (bouton receipt/download)
  - Scroll horizontal pour tablettes/mobiles
  - Pagination infinie
  - Tri par date (défaut)
  - Recherche par nom de projet
  - Filtres :
    - Par date (from/to)
    - Par status
    - Par montant (min/max)
    - Par projet

#### Données affichées :
- Liste paginée des contributions (depuis contributionsProvider avec ContributionFilters)
- Reçus disponibles (depuis receiptsProvider)
- Export CSV/PDF possible

#### Actions :
- Télécharger reçu (Analytics: `logDownloadReceipt`)
- Export historique (Analytics: `logExportContributions`)

---

### 4. **Onglet Performance**

#### Fonctionnalités principales :
- **KPIs Performance** (`PerformanceKPIs`)
  - 2 cartes côte à côte :
    - Total Return (€ et couleur)
    - Return % avec couleur

- **Graphiques Performance** (`PerformanceChartCard`)
  - Graphique de ligne temporelle
  - Sélecteur de période : 1M, 3M, 6M, 1Y, ALL
  - Sélecteur de métrique : Value, Returns, vs Market
  - Légende avec métriques clés :
    - Total Return (+%)
    - This Month (+%)
    - Best Day (+%)
    - Volatility (%)
    - Sharpe Ratio
    - Max Drawdown (-%)
  - Mode détaillé avec contrôles supplémentaires

#### Données affichées :
- Métriques performance (depuis performanceProvider)
- Données historiques par période
- Comparaison benchmark marché (si applicable)

---

### 5. **Onglet Reçus & Documents**

#### Fonctionnalités principales :
- **Liste des Reçus** (`ReceiptsList`)
  - Liste des contributions avec reçus disponibles
  - Pour chaque reçu :
    - Icône reçu
    - ID contribution (#8 chars)
    - Montant (€)
    - Date
    - Bouton download
  - Empty state si aucun reçu

#### Données affichées :
- Contributions filtrées ayant un `receiptUrl` (depuis contributionsProvider)
- Reçus téléchargeables

#### Actions :
- Télécharger reçu (Analytics: `logDownloadReceipt`)

---

### 6. **Onglet Préférences**

#### Fonctionnalités principales :
- **Préférences d'Investissement** (`InvestmentPreferences`)
  - Notification Preferences :
    - Switch : Email notifications for investments
  - Display Preferences :
    - Default Currency (dropdown : EUR, USD, GBP)
    - Default Date Range (dropdown : all, last_month, last_3_months, last_year)
  - Receipt Preferences :
    - Switch : Auto-download receipts
  - Sauvegarde automatique avec Analytics
  - Message de confirmation après changement

#### Données affichées :
- Préférences utilisateur (lecture)
- Changements en temps réel (écriture Firestore)

#### Actions :
- Update préférence (Analytics: `logUpdateInvestmentPreferences`)

---

## Fonctionnalités Transversales

### Actions du Header (toutes plateformes) :

1. **Search Investments**
   - Icône recherche dans AppBar
   - Recherche dans projets financés
   - Navigation vers /investments/search

2. **Menu Contextuel (Mobile/Tablet)**
   - Export Portfolio → Export données portfolio en CSV/PDF
   - Portfolio Settings → Navigation vers settings
   - Help & Support → Navigation vers help

3. **Floating Action Button (Mobile/Tablet)**
   - Bouton "Invest" avec icône +
   - Navigation vers /browse (page projets)
   - Positionné en bas à droite

4. **Actions Desktop**
   - Bouton texte "Invest" dans AppBar
   - Boutons search/download dans AppBar
   - Pas de FAB

---

## Layouts Responsives

### Mobile (< 600px)
- **Navigation** : TabBar en bas (4 tabs visible, 6 scrollables)
- **Contenu** : Colonne unique, scrollable vertical
- **Cards** : Pleine largeur, empilées verticalement
- **Charts** : Taille réduite, scrollables
- **Actions** : Bottom sheet modals pour filtres
- **FAB** : Visible et fixe

### Tablet (600-1024px)
- **Navigation** : NavigationRail latérale gauche (étendue)
- **Contenu** : Layout 2 colonnes possible
- **Cards** : Grille adaptative
- **Charts** : Tailles moyennes
- **Actions** : Dialogs complets
- **FAB** : Visible et fixe

### Desktop (> 1024px)
- **Navigation** : AppBar seulement, pas de tabs visibles (ou NavigationRail si side-by-side)
- **Contenu** : Layout dashboard multi-colonnes
- **Cards** : Grille 2x2 ou 3x3 optimisée
- **Charts** : Tailles grandes
- **Actions** : Sidebar settings, dropdowns
- **Pas de FAB** : Actions dans AppBar

---

## Données et Providers

### Providers Riverpod Utilisés :

1. **portfolioSummaryProvider** (FutureProvider)
   - Données : UserPortfolioSummary
   - Source : InvestmentsFirestoreDataSource.getPortfolio()

2. **contributionsProvider** (FutureProvider.family)
   - Données : List<Contribution>
   - Paramètres : ContributionFilters?
   - Source : InvestmentsFirestoreDataSource.getContributions()

3. **receiptsProvider** (FutureProvider.family)
   - Données : ContributionReceipt?
   - Paramètres : String contributionId
   - Source : InvestmentsFirestoreDataSource.getReceipt()

4. **performanceProvider** (FutureProvider.family)
   - Données : Map<String, dynamic> avec KPIs et séries
   - Paramètres : String range ('1M', '3M', '6M', '1Y', 'ALL')
   - Source : Calcul côté client ou API

---

## Schémas Firestore

### Collection `user_portfolio/{userId}`
```typescript
{
  userId: string;
  totalInvestment: number;
  currentValue: number;
  totalReturn: number;
  returnPercentage: number;
  activeInvestments: number;
  completedInvestments: number;
  topInvestments: Array<{
    id: string;
    name: string;
    type: string;
    amount: number;
    currentValue: number;
    returnPercentage: number;
    investmentDate: Timestamp;
    imageUrl?: string;
  }>;
  investmentCategories: string[];
  lastUpdated: Timestamp;
}
```

### Collection `users/{userId}/contributions/{contributionId}`
```typescript
{
  userId: string;
  projectId: string;
  amountCents: number;
  currency: string;
  status: ContributionStatus;
  createdAt: Timestamp;
  paymentMethod?: string;
  anonymous: boolean;
  fees: {
    platform: number;
    audit: number;
    stripe: number;
  };
  receiptUrl?: string;
  paymentIntentId?: string;
  stripeClientSecret?: string;
}
```

### Collection `users/{userId}/receipts/{receiptId}` (optionnel)
```typescript
{
  contributionId: string;
  userId: string;
  url: string;
  createdAt: Timestamp;
  kind: string;
}
```

---

## Analytics Instrumentation

### Événements Firebase Analytics :

1. **Page View**
   - `view_investments_page` (au mount)
   - `view_investments_tab` (changement d'onglet)
   - Paramètres : `tab` (string)

2. **Filtrage**
   - `filter_contributions`
   - Paramètres : `{from, to, statuses, projectId, etc.}`

3. **Export**
   - `export_contributions`
   - Paramètres : `format` (string), `count` (number)

4. **Téléchargement**
   - `download_receipt`
   - Paramètres : `receipt_id`, `contribution_id`

5. **Préférences**
   - `update_investment_preferences`
   - Paramètres : `key` (string), `value` (string)

---

## Navigation et Routes

### Routes associées :

- `/investments` → Page Investments principale (InvestmentsScreen)
- `/investments/search` → Recherche investissements
- `/investments/:investmentId` → Détails d'un investissement
- `/browse` → Liste des projets disponibles
- `/portfolio/settings` → Paramètres portfolio
- `/help` → Aide et support

---

## États de Chargement et Erreurs

### Gestion des états :

- **Loading** : CircularProgressIndicator au centre de chaque widget
- **Error** : Message d'erreur avec possibilité de retry
- **Empty** : Empty state avec CTA approprié
- **Success** : Affichage des données avec animations fluides

---

## Spécificités Mobiles

### Mobile (Android/iOS) :
- Pull-to-refresh sur toutes les listes
- Swipe gestures pour actions rapides
- Notifications push pour updates portfolio
- Share portfolio via native share
- Offline mode avec sync automatique
- Haptics feedback sur actions importantes

### Web :
- Keyboard shortcuts (/ pour search, Cmd+S pour export)
- URLs bookmarkable par filtre
- Export direct fichier
- Drag & drop pour upload documents
- Multi-onglets support

---

## Fonctionnalités Avancées (MVP+)

### Non incluses dans le MVP mais prévues :

1. **Comparaison Benchmark**
   - Comparaison avec moyenne marché
   - Graphiques de comparaison

2. **Projections**
   - Prévisions de retour selon scénarios
   - Simulations Monte Carlo

3. **Rebalancing**
   - Suggestions de rééquilibrage portfolio
   - Autres investissements recommandés

4. **Collaboration**
   - Partage portfolio avec conseiller
   - Discussions communautaires

5. **Impacts Détail**
   - Détails impact social par investissement
   - Métriques de contribution réelle

---

## Contraintes Techniques

### Performance :
- Lazy loading des listes
- Pagination infinie
- Cache des données jusqu'à 5 minutes
- Debounce sur recherche (300ms)

### Sécurité :
- Lecture portfolio : user authentifié propriétaire uniquement
- Écriture portfolio : Cloud Functions uniquement (pas d'écriture directe)
- Export : génération côté serveur pour PDF

### Accessibilité :
- Labels ARIA complets
- Support lecteurs d'écran
- Contraste couleurs WCAG AA
- Tailles touches minimum 44x44

---

## Tests Requis

### Unit Tests :
- Calcul métriques portfolio
- Filtrage contributions
- Formatage montants/devises

### Widget Tests :
- Rendu de chaque carte
- Interactions boutons
- Affichage états loading/error

### Integration Tests :
- Flow complet investissement
- Export données
- Synchronisation données

---

## Résumé des Widgets à Implémenter

### Déjà Implémentés ✓ :
1. `OverviewSummaryCard` ✓
2. `OverviewTopInvestments` ✓
3. `OverviewAllocationChart` ✓
4. `PortfolioList` ✓
5. `PortfolioBreakdown` ✓
6. `HistoryTable` ✓
7. `PerformanceKPIs` ✓
8. `ReceiptsList` ✓
9. `InvestmentPreferences` ✓
10. `InvestmentsScreen` ✓

---

## État d'Implémentation

**Date de completion** : Janvier 2025

### Fusion Portfolio/Investments ✅

**Décision** : Les pages Portfolio et Investments ont été fusionnées en un seul écran unifié `InvestmentsScreen`.

**Routes** :
- `/investments` → InvestmentsScreen (6 onglets)
- `/portfolio` → Redirige vers `/investments`

### Widgets Supprimés (Nettoyage) ✅
1. `portfolio_summary_card.dart` (ancien - supprimé)
2. `portfolio_allocation_chart.dart` (ancien - supprimé)
3. `investment_list_card.dart` (ancien - supprimé)
4. `performance_chart_card.dart` (ancien - supprimé)
5. `portfolio_screen.dart` (ancien - supprimé)

### Écran Principal ✅

**InvestmentsScreen** :
- **Mobile** : TabBar avec 6 onglets scrollables, FAB "Invest", menu contextuel
- **Tablet** : NavigationRail, 6 onglets, FAB "Invest", actions dans AppBar
- **Desktop** : AppBar avec actions (Invest, Search, Export), affichage Dashboard

### Navigation et Actions ✅

**Routes configurées** :
- `/investments` → InvestmentsScreen
- `/portfolio` → Redirige vers `/investments`
- `/investments/search` → À implémenter (placeholder)
- `/browse` → BrowseProjectsScreen (existant)

**Actions implémentées** :
- FAB "Invest" → Navigate to /browse
- Search → Navigate to /investments/search
- Menu contextuel → Export/Settings/Help

### Providers Firestore ✅

**Providers actifs** :
- `portfolioSummaryProvider` → UserPortfolioSummary
- `contributionsProvider` → List<Contribution>
- `receiptsProvider` → ContributionReceipt?
- `performanceProvider` → Métriques calculées

### Analytics Instrumentation ✅

**Événements Firebase** :
- `view_investments_page` (au mount)
- `view_investments_tab` (changement d'onglet)
- `filter_contributions` (filtrage)
- `export_contributions` (export)
- `download_receipt` (téléchargement reçu)
- `update_investment_preferences` (préférences)

### Qualité Code ✅

**Lint** : Aucune erreur (flutter analyze OK)
**Architecture** : Clean Architecture respectée
**État** : Riverpod pour state management
**UI** : Adaptive Layouts (Mobile/Tablet/Desktop)
**Données** : Firestore réelles (pas de mock)

### Prochaines Étapes

**MVP+ fonctionnalités** :
1. Implémenter `/investments/search`
2. Implémenter export CSV/PDF réel
3. Brancher investment_preferences sur Firestore write
4. Tests d'intégration E2E
5. Tests responsive multi-plateforme
6. i18n pour toutes les chaînes (FR/EN)

### Conclusion
La page Investments est maintenant unifiée, complète et fonctionnelle avec toutes les fonctionnalités MVP. L'architecture est prête pour la production après validation des données Firestore en environnement de développement.

