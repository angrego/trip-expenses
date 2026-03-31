Class {
	#name : 'AddExpenseView',
	#superclass : 'CpView',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'web resources' }
AddExpenseView class >> style [ 
     
<webResource: #css>
    ^ '@import url("https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css");
    :host { display: block; }'
]

{ #category : 'web resources' }
AddExpenseView class >> template [
 <webResource: #html>
    ^ '
        <ion-app>
            <ion-header>
                <ion-toolbar color="primary">
                    <ion-title>Nouvelle dépense</ion-title>
                </ion-toolbar>
            </ion-header>
            <ion-content class="ion-padding">
                <ion-list>
                    <ion-item>
                        <ion-input id="description" label="Description" 
                            placeholder="Ex: Restaurant, Hôtel..." label-placement="floating"></ion-input>
                    </ion-item>
                    <ion-item>
                        <ion-input id="amount" label="Montant (EUR)" type="number"
                            placeholder="0.00" label-placement="floating"></ion-input>
                    </ion-item>
                    <ion-item>
                        <ion-label>Payé par</ion-label>
                        <select id="payer"></select>
                    </ion-item>
                </ion-list>
                <ion-list-header>
                    <ion-label>Répartir entre</ion-label>
                </ion-list-header>
                <ion-list>
                    <slot name="participants"></slot>
                </ion-list>
                <ion-list-header>
                    <ion-label>Cadeaux (optionnel)</ion-label>
                </ion-list-header>
                <slot name="gifts"></slot>
                <ion-button expand="block" id="add-gift-btn">+ Cadeau</ion-button>
                <ion-button expand="block" color="primary" id="save-btn">Enregistrer</ion-button>
                <ion-button expand="block" color="light" id="cancel-btn">Annuler</ion-button>
            </ion-content>
        </ion-app>
    '
]

{ #category : 'web resources' }
AddExpenseView class >> templateString [ 
<webResource: #html>
    ^ '
        <label>Description</label>
        <input type="text" id="description" placeholder="Ex: Restaurant, Hôtel..."/>
        <label>Montant total (EUR)</label>
        <input type="number" id="amount" placeholder="0.00" step="0.1"/>
        <label>Payé par</label>
        <select id="payer"></select>
        <h3>Répartir entre</h3>
        <slot name="participants"></slot>
        <h3>Cadeaux (optionnel)</h3>
        <slot name="gifts"></slot>
        <button class="btn-add-gift" id="add-gift-btn">+ Ajouter un cadeau</button>
        <div class="actions">
            <button class="btn-cancel" id="cancel-btn">Annuler</button>
            <button class="btn-save" id="save-btn">Enregistrer</button>
        </div>
    '
]

{ #category : 'initialization' }
AddExpenseView >> addGiftRow: participantNames [
    | list options row |
    options := participantNames
        inject: ''
        into: [ :acc :name | acc , '<option>' , name , '</option>' ].
    row := '<div class="gift-row">'
        , '<select>' , options , '</select>'
        , '<span>→</span>'
        , '<select>' , options , '</select>'
        , '<input type="number" placeholder="€" min="0"/>'
        , '</div>'.
    (self shadowedElementWithId: #'gifts-list') innerHTML:
        (self shadowedElementWithId: #'gifts-list') innerHTML , row
]

{ #category : 'initialization' }
AddExpenseView >> addPayerOption: anId name: aName [ 
 | select current |
    select := self shadowedElementWithId: #payer.
    current := select markupContent.
    select markupContent: current , '<option value="' , anId , '">' , aName , '</option>'
]

{ #category : 'initialization' }
AddExpenseView >> clearPayer [
(self shadowedElementWithId: #payer) markupContent: ''
]

{ #category : 'initialization' }
AddExpenseView >> collectGifts [
    ^ #()
]

{ #category : 'initialization' }
AddExpenseView >> collectParticipantWeights [
    "Retourne une collection d'associations id->weight pour les participants cochés"
    ^ self serverAnnounce: CpCollectFormDataAnnouncement new
]

{ #category : 'initialization' }
AddExpenseView >> initializeShadowRoot [
    super initializeShadowRoot.
    (self shadowedElementWithId: #'cancel-btn')
        when: CpClickEvent basicPrimary send: #onCancel to: self.
    (self shadowedElementWithId: #'save-btn')
        when: CpClickEvent basicPrimary send: #onSave to: self.
    (self shadowedElementWithId: #'add-gift-btn')
        when: CpClickEvent basicPrimary send: #onAddGift to: self
]

{ #category : 'initialization' }
AddExpenseView >> onAddGift [
    self serverAnnounce: CpAddGiftRowAnnouncement new
]

{ #category : 'initialization' }
AddExpenseView >> onCancel [
    self serverAnnounce: CpCancelExpenseAnnouncement new
]

{ #category : 'initialization' }
AddExpenseView >> onSave [ 
     | ann |

self crTrace:((self shadowedElementWithId: #payer) propertyAt: 'value').
    ann := CpSaveExpenseAnnouncement new.
    ann description: ((self shadowedElementWithId: #description) propertyAt: 'value').
    ann amount: ((self shadowedElementWithId: #amount) propertyAt: 'value').
    ann payerId: ((self shadowedElementWithId: #payer) propertyAt: 'value').
    self serverAnnounce: ann
]

{ #category : 'initialization' }
AddExpenseView >> renderParticipants: aCollection [
    | list |
    list := self shadowedElementWithId: #'participants-list'.
    list innerHTML: ''.
    aCollection do: [ :p |
        | row |
        row := '<div class="participant-row">'
            , '<input type="checkbox" id="cb-' , p id value , '" checked/>'
            , '<span style="flex:1">' , p name , '</span>'
            , '<input type="number" id="w-' , p id value , '" value="1" min="1" max="10"/>'
            , '</div>'.
        list innerHTML: list innerHTML , row ]
]

{ #category : 'initialization' }
AddExpenseView >> renderPayer: aCollection [
    | select |
    select := self shadowedElementWithId: #payer.
    select innerHTML: ''.
    aCollection do: [ :p |
        select innerHTML: select innerHTML
            , '<option value="' , p id value , '">' , p name , '</option>' ]
]
